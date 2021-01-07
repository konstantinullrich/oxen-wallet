import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxen_wallet/generated/l10n.dart';
import 'package:oxen_wallet/routes.dart';
import 'package:oxen_wallet/src/screens/base_page.dart';
import 'package:oxen_wallet/src/screens/auth/auth_page.dart';
import 'package:oxen_wallet/src/widgets/nav/nav_list_arrow.dart';
import 'package:oxen_wallet/src/widgets/nav/nav_list_header.dart';

class ProfilePage extends BasePage {
  final _bodyKey = GlobalKey();

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

  @override
  Widget trailing(BuildContext context) {
    return SizedBox(
      width: 25,
      child: FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: () => Navigator.of(context).pushNamed(Routes.settings),
          child: Icon(Icons.settings_rounded,
              color: Theme.of(context).primaryTextTheme.caption.color,
              size: 25)),
    );
  }

  @override
  Widget body(BuildContext context) => ProfilePageBody(key: _bodyKey);
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
                leading: Icon(Icons.account_balance_wallet_rounded,
                    color: Theme.of(context).primaryTextTheme.headline6.color),
                text: S.current.wallets,
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.walletList)),
            NavListArrow(
                leading: Icon(Icons.settings_rounded,
                    color: Theme.of(context).primaryTextTheme.headline6.color),
                text: S.current.settings_title,
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.settings)),
            NavListHeader(title: S.current.wallet_menu),
            /*
            TODO: Waiting for Implementation
            NavListArrow(
                leading: Icon(Icons.attach_money_rounded,
                    color: Theme.of(context).primaryTextTheme.headline6.color),
                text: S.current.stakes,
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.stake)),
             */
            NavListArrow(
                leading: Icon(Icons.contacts_rounded,
                    color: Theme.of(context).primaryTextTheme.headline6.color),
                text: S.current.address_book_menu,
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.addressBook)),
            NavListArrow(
                leading: Icon(Icons.account_circle_rounded,
                    color: Theme.of(context).primaryTextTheme.headline6.color),
                text: S.current.accounts,
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.accountList)),
            NavListArrow(
                leading: Icon(Icons.vpn_key_rounded,
                    color: Theme.of(context).primaryTextTheme.headline6.color),
                text: S.current.show_keys,
                onTap: () => Navigator.of(context).pushNamed(Routes.auth,
                    arguments: (bool isAuthenticatedSuccessfully,
                            AuthPageState auth) =>
                        isAuthenticatedSuccessfully
                            ? Navigator.of(auth.context)
                                .popAndPushNamed(Routes.showKeys)
                            : null)),
            NavListArrow(
                leading: Icon(Icons.vpn_key_rounded,
                    color: Theme.of(context).primaryTextTheme.headline6.color),
                text: S.current.show_seed,
                onTap: () => Navigator.of(context).pushNamed(Routes.auth,
                    arguments: (bool isAuthenticatedSuccessfully,
                            AuthPageState auth) =>
                        isAuthenticatedSuccessfully
                            ? Navigator.of(auth.context)
                                .popAndPushNamed(Routes.seed)
                            : null)),
          ],
        ),
      ],
    ));
  }
}
