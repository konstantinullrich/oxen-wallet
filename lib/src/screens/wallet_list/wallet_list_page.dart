import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:oxen_wallet/routes.dart';
import 'package:oxen_wallet/palette.dart';
import 'package:oxen_wallet/generated/l10n.dart';
import 'package:oxen_wallet/src/widgets/primary_button.dart';
import 'package:oxen_wallet/src/wallet/wallet_description.dart';
import 'package:oxen_wallet/src/screens/base_page.dart';
import 'package:oxen_wallet/src/widgets/scollable_with_bottom_section.dart';
import 'package:oxen_wallet/src/stores/wallet_list/wallet_list_store.dart';
import 'package:oxen_wallet/src/screens/wallet_list/wallet_menu.dart';
import 'package:oxen_wallet/src/widgets/picker.dart';

class WalletListPage extends BasePage {
  @override
  bool get isModalBackButton => true;

  @override
  String get title => S.current.wallet_list_title;

  @override
  AppBarStyle get appBarStyle => AppBarStyle.withShadow;

  @override
  Widget body(BuildContext context) => WalletListBody();
}

class WalletListBody extends StatefulWidget {
  @override
  WalletListBodyState createState() => WalletListBodyState();
}

class WalletListBodyState extends State<WalletListBody> {
  WalletListStore _walletListStore;

  void presetMenuForWallet(WalletDescription wallet, BuildContext bodyContext) {
    final isCurrentWallet = false;
    final walletMenu = WalletMenu(bodyContext);
    final items = walletMenu.generateItemsForWalletMenu(isCurrentWallet);

    showDialog<void>(
      context: bodyContext,
      builder: (_) =>
          Picker(
              items: items,
              selectedAtIndex: -1,
              title: S.of(context).wallet_menu,
              onItemSelected: (String item) =>
                  walletMenu.action(
                      walletMenu.listItems.indexOf(item), wallet,
                      isCurrentWallet)),
    );
  }

  @override
  Widget build(BuildContext context) {
    _walletListStore = Provider.of<WalletListStore>(context);

    return ScrollableWithBottomSection(
        content: Container(
          child: Observer(
            builder: (_) =>
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, index) =>
                        Divider(
                            color: Theme
                                .of(context)
                                .dividerTheme
                                .color, height: 1.0),
                    itemCount: _walletListStore.wallets.length,
                    itemBuilder: (__, index) {
                      final wallet = _walletListStore.wallets[index];
                      final isCurrentWallet =
                      _walletListStore.isCurrentWallet(wallet);

                      return InkWell(
                          onTap: () =>
                          isCurrentWallet
                              ? null
                              : presetMenuForWallet(wallet, context),
                          child: Container(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: ListTile(
                                  title: Text(
                                    wallet.name,
                                    style: TextStyle(
                                        color: isCurrentWallet
                                            ? OxenPalette.teal
                                            : Theme
                                            .of(context)
                                            .primaryTextTheme
                                            .headline5
                                            .color,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  trailing: isCurrentWallet
                                      ? Icon(
                                    Icons.check_rounded,
                                    color: OxenPalette.teal,
                                    size: 20.0,
                                  )
                                      : null)));
                    }),
          ),
        ),
        bottomSection: Column(children: <Widget>[
          PrimaryIconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.newWallet),
              iconData: Icons.add_rounded,
              color: Theme
                  .of(context)
                  .primaryTextTheme
                  .button
                  .backgroundColor,
              borderColor:
              Theme
                  .of(context)
                  .primaryTextTheme
                  .button
                  .decorationColor,
              iconColor: OxenPalette.teal,
              iconBackgroundColor: Theme
                  .of(context)
                  .primaryIconTheme
                  .color,
              text: S
                  .of(context)
                  .wallet_list_create_new_wallet),
          SizedBox(height: 10.0),
          PrimaryIconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.restoreWalletOptions),
              iconData: Icons.refresh_rounded,
              text: S
                  .of(context)
                  .wallet_list_restore_wallet,
              color: Theme
                  .of(context)
                  .accentTextTheme
                  .button
                  .backgroundColor,
              borderColor:
              Theme
                  .of(context)
                  .accentTextTheme
                  .button
                  .decorationColor,
              iconColor: Theme
                  .of(context)
                  .primaryTextTheme
                  .caption
                  .color,
              iconBackgroundColor: Theme
                  .of(context)
                  .accentIconTheme
                  .color)
        ]));
  }
}
