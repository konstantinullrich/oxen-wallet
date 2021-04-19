import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oxen_wallet/generated/l10n.dart';
import 'package:oxen_wallet/src/domain/services/wallet_list_service.dart';
import 'package:oxen_wallet/src/domain/services/wallet_service.dart';
import 'package:oxen_wallet/src/stores/wallet_restoration/wallet_restoration_store.dart';
import 'package:oxen_wallet/src/stores/wallet_restoration/wallet_restoration_state.dart';
import 'package:oxen_wallet/src/screens/base_page.dart';
import 'package:oxen_wallet/src/widgets/primary_button.dart';
import 'package:oxen_wallet/src/widgets/blockchain_height_widget.dart';
import 'package:oxen_wallet/src/widgets/scollable_with_bottom_section.dart';
import 'package:oxen_wallet/palette.dart';
import 'package:oxen_wallet/src/stores/seed_language/seed_language_store.dart';

class RestoreWalletFromKeysPage extends BasePage {
  RestoreWalletFromKeysPage(
      {@required this.walletsService,
      @required this.sharedPreferences,
      @required this.walletService});

  final WalletListService walletsService;
  final WalletService walletService;
  final SharedPreferences sharedPreferences;

  @override
  String get title => S.current.restore_title_from_keys;

  @override
  Widget body(BuildContext context) => RestoreFromKeysFrom();
}

class RestoreFromKeysFrom extends StatefulWidget {
  @override
  _RestoreFromKeysFromState createState() => _RestoreFromKeysFromState();
}

class _RestoreFromKeysFromState extends State<RestoreFromKeysFrom> {
  final _formKey = GlobalKey<FormState>();
  final _blockchainHeightKey = GlobalKey<BlockchainHeightState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _viewKeyController = TextEditingController();
  final _spendKeyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final walletRestorationStore = Provider.of<WalletRestorationStore>(context);
    final seedLanguageStore = Provider.of<SeedLanguageStore>(context);

    reaction((_) => walletRestorationStore.state, (WalletRestorationState state) {
      if (state is WalletRestoredSuccessfully) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }

      if (state is WalletRestorationFailure) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text(state.error),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(S.of(context).ok),
                    ),
                  ],
                );
              });
        });
      }
    });

    return ScrollableWithBottomSection(
      contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      content: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 13, right: 13),
              child: Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    Flexible(
                        child: Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        style: TextStyle(fontSize: 14.0),
                        controller: _nameController,
                        decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: Theme.of(context).hintColor),
                            hintText: S.of(context).restore_wallet_name,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: OxenPalette.teal, width: 2.0)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).focusColor,
                                    width: 1.0))),
                        validator: (value) {
                          walletRestorationStore.validateWalletName(value);
                          return walletRestorationStore.errorMessage;
                        },
                      ),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                        child: Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        style: TextStyle(fontSize: 14.0),
                        controller: _addressController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: Theme.of(context).hintColor),
                            hintText: S.of(context).restore_address,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: OxenPalette.teal, width: 2.0)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).focusColor,
                                    width: 1.0))),
                        validator: (value) {
                          walletRestorationStore.validateAddress(value);
                          return walletRestorationStore.errorMessage;
                        },
                      ),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                        child: Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        style: TextStyle(fontSize: 14.0),
                        controller: _viewKeyController,
                        decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: Theme.of(context).hintColor),
                            hintText: S.of(context).restore_view_key_private,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: OxenPalette.teal, width: 2.0)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).focusColor,
                                    width: 1.0))),
                        validator: (value) {
                          walletRestorationStore.validateKeys(value);
                          return walletRestorationStore.errorMessage;
                        },
                      ),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                        child: Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        style: TextStyle(fontSize: 14.0),
                        controller: _spendKeyController,
                        decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: Theme.of(context).hintColor),
                            hintText: S.of(context).restore_spend_key_private,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: OxenPalette.teal, width: 2.0)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).focusColor,
                                    width: 1.0))),
                        validator: (value) {
                          walletRestorationStore.validateKeys(value);
                          return walletRestorationStore.errorMessage;
                        },
                      ),
                    ))
                  ],
                ),
                BlockchainHeightWidget(key: _blockchainHeightKey),
              ]),
            )
          ],
        ),
      ),
      bottomSection: Observer(builder: (_) {
        return LoadingPrimaryButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                walletRestorationStore.restoreFromKeys(
                    name: _nameController.text,
                    language: seedLanguageStore.selectedSeedLanguage,
                    address: _addressController.text,
                    viewKey: _viewKeyController.text,
                    spendKey: _spendKeyController.text,
                    restoreHeight: _blockchainHeightKey.currentState.height);
              }
            },
            text: S.of(context).restore_recover,
            color: Theme.of(context).primaryTextTheme.button.backgroundColor,
            borderColor:
                Theme.of(context).primaryTextTheme.button.decorationColor);
      }),
    );
  }
}
