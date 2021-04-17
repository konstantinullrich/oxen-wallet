import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxen_coin/oxen_coin_structs.dart';
import 'package:oxen_coin/stake.dart';
import 'package:oxen_wallet/generated/l10n.dart';
import 'package:oxen_wallet/palette.dart';
import 'package:oxen_wallet/routes.dart';
import 'package:oxen_wallet/src/screens/auth/auth_page.dart';
import 'package:oxen_wallet/src/screens/base_page.dart';
import 'package:oxen_wallet/src/wallet/crypto_amount_format.dart';
import 'package:oxen_wallet/src/wallet/oxen/oxen_amount_format.dart';
import 'package:oxen_wallet/src/widgets/nav/nav_list_header.dart';
import 'package:oxen_wallet/src/widgets/nav/nav_list_trailing.dart';
import 'package:oxen_wallet/src/widgets/oxen_dialog.dart';

extension StakeParsing on StakeRow {
  double get ownedPercentage {
    final percentage = oxenAmountToDouble(amount) / 15000;
    if (percentage > 1) return 1;
    return percentage;
  }
}

class StakePage extends BasePage {
  final _bodyKey = GlobalKey();

  @override
  Widget body(BuildContext context) => StakePageBody(key: _bodyKey);
}

class StakePageBody extends StatefulWidget {
  StakePageBody({Key key}) : super(key: key);

  @override
  StakePageBodyState createState() => StakePageBodyState();
}

class StakePageBodyState extends State<StakePageBody> {
  List<StakeRow> allStakes = getAllStakes();

  Color get stakeColor =>
      allStakes.isEmpty ? OxenPalette.lightRed : OxenPalette.lime;

  int get totalAmountStaked {
    var totalAmount = 0;
    for (final stake in allStakes) {
      totalAmount += stake.amount;
    }
    return totalAmount;
  }

  double get stakePercentage {
    if (allStakes.isEmpty) return 1;
    final percentage = oxenAmountToDouble(totalAmountStaked) / 15000;
    if (percentage > 1) return 1;
    return percentage;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: 220.0,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      strokeWidth: 15,
                      value: stakePercentage,
                      valueColor: AlwaysStoppedAnimation<Color>(stakeColor),
                    ),
                  ),
                ),
                Center(
                    child: Text(allStakes.isNotEmpty
                        ? oxenAmountToString(totalAmountStaked,
                            detail: AmountDetail.none)
                        : S.current.nothing_staked)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_upward_rounded),
                  onPressed: () => Navigator.of(context, rootNavigator: true)
                      .pushNamed(Routes.newStake),
                ),
                Text(allStakes.isEmpty
                    ? S.current.start_staking
                    : S.current.stake_more)
              ],
            ),
          ),
          if (allStakes.isNotEmpty)
            NavListHeader(title: S.current.your_contributions),
          if (allStakes.isNotEmpty)
            ListView.builder(
                shrinkWrap: true,
                itemCount: allStakes.length,
                itemBuilder: (BuildContext context, int index) {
                  final stake = allStakes[index];
                  final serviceNodeKey = stake.serviceNodeKey;
                  final nodeName =
                      '${serviceNodeKey.substring(0, 12)}...${serviceNodeKey.substring(serviceNodeKey.length - 4)}';

                  return Dismissible(
                      key: Key(stake.serviceNodeKey),
                      confirmDismiss: (direction) async {
                        if (!canRequestUnstake(stake.serviceNodeKey)) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(S.of(context).unable_unlock_stake),
                            backgroundColor: Colors.red,
                          ));
                          return false;
                        }
                        var isSuccessful = false;
                        var isAuthenticated = false;

                        await Navigator.of(context).pushNamed(Routes.auth,
                            arguments: (bool isAuthenticatedSuccessfully,
                                AuthPageState auth) async {
                          if (isAuthenticatedSuccessfully) {
                            isAuthenticated = true;
                            Navigator.of(auth.context).pop();
                          }
                        });

                        if (isAuthenticated) {
                          await showConfirmOxenDialog(
                              context,
                              S.of(context).title_confirm_unlock_stake,
                              S.of(context).body_confirm_unlock_stake(
                                  stake.serviceNodeKey),
                              onDismiss: (buildContext) {
                            isSuccessful = false;
                            Navigator.of(buildContext).pop();
                          }, onConfirm: (buildContext) {
                            isSuccessful = true;
                            Navigator.of(buildContext).pop();
                          });
                        }

                        return isSuccessful;
                      },
                      onDismissed: (direction) async {
                        await submitStakeUnlock(stake.serviceNodeKey);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(S.of(context).unlock_stake_requested),
                          backgroundColor: Colors.green,
                        ));
                      },
                      direction: DismissDirection.endToStart,
                      background: Container(
                          padding: EdgeInsets.only(right: 10.0),
                          alignment: AlignmentDirectional.centerEnd,
                          color: OxenPalette.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Icon(
                                Icons.arrow_downward_sharp,
                                color: Colors.white,
                              )
                            ],
                          )),
                      child: NavListTrailing(
                        leading: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(stakeColor),
                            value: stake.ownedPercentage),
                        text: nodeName,
                      ));
                }),
        ],
      ),
    );
  }
}
