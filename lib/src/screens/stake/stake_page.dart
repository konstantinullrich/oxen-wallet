import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxen_coin/stake.dart';
import 'package:oxen_coin/structs/stake_row.dart';
import 'package:oxen_wallet/generated/l10n.dart';
import 'package:oxen_wallet/palette.dart';
import 'package:oxen_wallet/routes.dart';
import 'package:oxen_wallet/src/screens/base_page.dart';
import 'package:oxen_wallet/src/widgets/nav/nav_list_arrow.dart';
import 'package:oxen_wallet/src/widgets/nav/nav_list_header.dart';

class StakePage extends BasePage {
  final _bodyKey = GlobalKey();

  // @override
  // Widget trailing(BuildContext context) {
  //   return SizedBox(
  //     width: 25,
  //     child: FlatButton(
  //         padding: EdgeInsets.all(0),
  //         onPressed: () => Navigator.of(context).pushNamed(Routes.settings),
  //         child: Icon(Icons.settings_rounded,
  //             color: Theme.of(context).primaryTextTheme.caption.color,
  //             size: 25)),
  //   );
  // }

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

  double get stakePercentage {
    if (allStakes.isEmpty) return 1;
    final percentage = allStakes.length / 4;
    if (percentage > 1) return 1;
    return percentage;
  }

  @override
  Widget build(BuildContext context) {
    if (allStakes.isNotEmpty) print('Stake ${allStakes[0].getServiceNodeKey()}');
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        ListView(
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
                  Center(child: Text(S.current.nothing_staked)),
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
                        .pushNamed(Routes.send),
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
                  itemCount: allStakes.length,
                  itemBuilder: (BuildContext context, int index) {
                    final stake = allStakes[index];
                    print(stake);
                    final nodeName =
                        '${stake.getServiceNodeKey().substring(0, 8)}...${stake.getServiceNodeKey().substring(-4)}';

                    return NavListArrow(
                        leading: CircularProgressIndicator(value: 1),
                        text: nodeName,
                        onTap: () => Navigator.of(context)
                            .pushNamed(Routes.accountList));
                  }),
            // NavListArrow(
            //     leading: CircularProgressIndicator(value: 0.5),
            //     text: '223ade37...8199',
            //     onTap: () =>
            //         Navigator.of(context).pushNamed(Routes.accountList)),
            // NavListArrow(
            //     leading: CircularProgressIndicator(value: 0.25),
            //     text: '02b3e662...4c14',
            //     onTap: () =>
            //         Navigator.of(context).pushNamed(Routes.accountList))
          ],
        ),
      ],
    ));
  }
}
