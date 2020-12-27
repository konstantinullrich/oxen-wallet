import 'package:flutter/material.dart';
import 'package:oxen_wallet/generated/l10n.dart';
import 'package:oxen_wallet/routes.dart';
import 'package:oxen_wallet/src/stores/balance/balance_store.dart';
import 'package:oxen_wallet/src/stores/wallet/wallet_store.dart';
import 'package:provider/provider.dart';

class WalletMenu {
  WalletMenu(this.context);

  final List<String> items = [
    S.current.reconnect,
    S.current.rescan,
    S.current.reload_fiat
  ];

  final BuildContext context;

  void action(int index) {
    switch (index) {
      case 0:
        _presentReconnectAlert(context);
        break;
      case 1:
        Navigator.of(context).pushNamed(Routes.rescan);
        break;
      case 2:
        Provider.of<BalanceStore>(context).updateFiatBalance();
        break;
    }
  }

  Future<void> _presentReconnectAlert(BuildContext context) async {
    final walletStore = Provider.of<WalletStore>(context);

    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              S.of(context).reconnection,
              textAlign: TextAlign.center,
            ),
            content: Text(S.of(context).reconnect_alert_text),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(S.of(context).cancel)),
              FlatButton(
                  onPressed: () {
                    walletStore.reconnect();
                    Navigator.of(context).pop();
                  },
                  child: Text(S.of(context).ok))
            ],
          );
        });
  }
}
