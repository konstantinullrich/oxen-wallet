import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:oxen_wallet/generated/l10n.dart';
import 'package:oxen_wallet/palette.dart';
import 'package:oxen_wallet/routes.dart';
import 'package:oxen_wallet/src/screens/base_page.dart';
import 'package:oxen_wallet/src/stores/account_list/account_list_store.dart';
import 'package:oxen_wallet/src/stores/wallet/wallet_store.dart';
import 'package:provider/provider.dart';

class AccountListPage extends BasePage {
  @override
  String get title => S.current.accounts;

  @override
  Widget trailing(BuildContext context) {
    final accountListStore = Provider.of<AccountListStore>(context);

    return Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Theme.of(context).selectedRowColor),
        child: IconButton(
          iconSize: 22,
          padding: EdgeInsets.zero,
          onPressed: () async {
            await Navigator.of(context).pushNamed(Routes.accountCreation);
            accountListStore.updateAccountList();
          },
          icon: Icon(Icons.add, color: OxenPalette.teal, size: 22.0),
        ));
  }

  @override
  Widget body(BuildContext context) {
    final accountListStore = Provider.of<AccountListStore>(context);
    final walletStore = Provider.of<WalletStore>(context);

    final currentColor = Theme.of(context).selectedRowColor;
    final notCurrentColor = Theme.of(context).backgroundColor;

    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      child: Observer(builder: (_) {
        final accounts = accountListStore.accounts;
        return ListView.builder(
            itemCount: accounts == null ? 0 : accounts.length,
            itemBuilder: (BuildContext context, int index) {
              final account = accounts[index];

              return Observer(builder: (_) {
                final isCurrent = walletStore.account.id == account.id;

                return Slidable(
                  key: Key(account.id.toString()),
                  actionPane: SlidableDrawerActionPane(),
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: S.of(context).edit,
                      color: Colors.blue,
                      icon: Icons.edit,
                      onTap: () async {
                        await Navigator.of(context).pushNamed(
                            Routes.accountCreation,
                            arguments: account);
                        // await accountListStore.updateAccountList().then((_) {
                        //   if (isCurrent) walletStore.setAccount(accountListStore.accounts[index]);
                        // });
                      },
                    )
                  ],
                  child: Container(
                    color: isCurrent ? currentColor : notCurrentColor,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            account.label,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .headline5
                                    .color),
                          ),
                          onTap: () {
                            if (isCurrent) return;

                            walletStore.setAccount(account);
                            Navigator.of(context).pop();
                          },
                        ),
                        Divider(
                          color: Theme.of(context).dividerTheme.color,
                          height: 1.0,
                        )
                      ],
                    ),
                  ),
                );
              });
            });
      }),
    );
  }
}
