import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxen_wallet/generated/i18n.dart';
import 'package:oxen_wallet/routes.dart';
import 'package:oxen_wallet/src/screens/base_page.dart';
import 'package:oxen_wallet/src/screens/auth/auth_page.dart';
import 'package:oxen_wallet/src/widgets/bottom_nav_bar.dart';
import 'package:oxen_wallet/src/widgets/nav/nav_list_arrow.dart';
import 'package:oxen_wallet/src/widgets/nav/nav_list_header.dart';

class ProfilePage extends BasePage {
  final _bodyKey = GlobalKey();

  @override
  Widget bottomNavigationBar(BuildContext context) =>
      BottomNavBar(currentIndex: 2);

  // @override
  // Widget middle(BuildContext context) {
  //   final walletStore = Provider.of<WalletStore>(context);
  //
  //   return Observer(builder: (_) {
  //     return Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Text(
  //             walletStore.name,
  //             style: TextStyle(
  //                 color: Theme.of(context).primaryTextTheme.headline6.color),
  //           ),
  //           SizedBox(height: 5),
  //           Text(
  //             walletStore.account != null ? '${walletStore.account.label}' : '',
  //             style: TextStyle(
  //                 fontWeight: FontWeight.w400,
  //                 fontSize: 10,
  //                 color: Theme.of(context).primaryTextTheme.headline6.color),
  //           ),
  //         ]);
  //   });
  // }

  // @override
  // Widget trailing(BuildContext context) {
  //   return SizedBox(
  //     width: 20,
  //     child: FlatButton(
  //         padding: EdgeInsets.all(0),
  //         onPressed: () => Navigator.of(context).pushNamed(Routes.settings),
  //         child: Image.asset('assets/images/settings_icon.png',
  //             color: Colors.grey, height: 20)),
  //   );
  // }

  @override
  Widget body(BuildContext context) => ProfilePageBody(key: _bodyKey);

// @override
// Widget floatingActionButton(BuildContext context) => FloatingActionButton(
//     child: Image.asset('assets/images/exchange_icon.png',
//         color: Colors.white, height: 26, width: 22),
//     backgroundColor: Palette.floatingActionButton,
//     onPressed: () async => await Navigator.of(context, rootNavigator: true)
//         .pushNamed(Routes.exchange));
}

class ProfilePageBody extends StatefulWidget {
  ProfilePageBody({Key key}) : super(key: key);

  @override
  ProfilePageBodyState createState() => ProfilePageBodyState();
}

class ProfilePageBodyState extends State<ProfilePageBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
          ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            NavListArrow(
                leading: Icon(Icons.settings_rounded),
                text: S.current.settings_title,
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.settings)),
            NavListArrow(
                leading: Icon(Icons.account_balance_wallet_rounded),
                text: S.current.wallets,
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.walletList)),
            NavListHeader(title: S.current.wallet_menu),
            NavListArrow(
                leading: Icon(Icons.contacts_rounded),
                text: S.current.address_book_menu,
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.addressBook)),
            NavListArrow(
                leading: Icon(Icons.account_circle_rounded),
                text: S.current.accounts,
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.accountList)),
            NavListArrow(
                leading: Icon(Icons.vpn_key_rounded),
                text: S.current.show_keys,
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.auth,
                        arguments: (bool isAuthenticatedSuccessfully,
                            AuthPageState auth) =>
                        isAuthenticatedSuccessfully
                            ? Navigator.of(auth.context)
                            .popAndPushNamed(Routes.showKeys)
                            : null)),
            NavListArrow(
              leading: Icon(Icons.vpn_key_rounded),
              text: S.current.show_seed,
              onTap: () =>
                  Navigator.of(context).pushNamed(Routes.auth,
                      arguments: (bool isAuthenticatedSuccessfully,
                          AuthPageState auth) =>
                      isAuthenticatedSuccessfully
                          ? Navigator.of(auth.context).popAndPushNamed(
                          Routes.seed)
                          : null)),
              ],
            ),
          ],
        ));
  }
}
