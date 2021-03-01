import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxen_coin/oxen_coin_structs.dart';
import 'package:oxen_coin/stake.dart';
import 'package:oxen_wallet/generated/l10n.dart';
import 'package:oxen_wallet/palette.dart';

import 'package:oxen_wallet/routes.dart';
import 'package:oxen_wallet/src/screens/base_page.dart';
import 'package:oxen_wallet/src/wallet/crypto_amount_format.dart';
import 'package:oxen_wallet/src/wallet/oxen/oxen_amount_format.dart';
import 'package:oxen_wallet/src/widgets/nav/nav_list_arrow.dart';
import 'package:oxen_wallet/src/widgets/nav/nav_list_header.dart';

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
            padding: const EdgeInsets.symmetric(vertical: 20),
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

                  return NavListArrow(
                      leading: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(stakeColor),
                          value: stake.ownedPercentage),
                      text: nodeName,
                      onTap: () {} // ToDo: Direct to Service Node Page
                      //Navigator.of(context).pushNamed(Routes.accountList)
                      );
                }),
        ],
      ),
    );
  }
}
