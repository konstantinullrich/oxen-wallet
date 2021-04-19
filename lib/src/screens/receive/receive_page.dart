import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oxen_wallet/generated/l10n.dart';
import 'package:oxen_wallet/palette.dart';
import 'package:oxen_wallet/routes.dart';
import 'package:oxen_wallet/src/screens/base_page.dart';
import 'package:oxen_wallet/src/screens/receive/qr_image.dart';
import 'package:oxen_wallet/src/stores/subaddress_list/subaddress_list_store.dart';
import 'package:oxen_wallet/src/stores/wallet/wallet_store.dart';
import 'package:oxen_wallet/src/widgets/oxen_text_field.dart';
import 'package:provider/provider.dart';

class ReceivePage extends BasePage {
  @override
  bool get isModalBackButton => true;

  @override
  String get title => S.current.receive;

  @override
  Widget trailing(BuildContext context) {
    final walletStore = context.read<WalletStore>();

    return SizedBox(
      height: 37.0,
      width: 37.0,
      child: ButtonTheme(
        minWidth: double.minPositive,
        child: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            padding: EdgeInsets.all(0),
            onPressed: () => Share.text(
                'Share address', walletStore.subaddress.address, 'text/plain'),
            icon: Icon(
              Icons.share,
              size: 25
            ))
      ),
    );
  }

  @override
  Widget body(BuildContext context) =>
      SingleChildScrollView(child: ReceiveBody());
}

class ReceiveBody extends StatefulWidget {
  @override
  ReceiveBodyState createState() => ReceiveBodyState();
}

class ReceiveBodyState extends State<ReceiveBody> {
  final amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final walletStore = Provider.of<WalletStore>(context);
    final subaddressListStore = Provider.of<SubaddressListStore>(context);

    final currentColor = Theme.of(context).selectedRowColor;
    final notCurrentColor = Theme.of(context).scaffoldBackgroundColor;

    amountController.addListener(() {
      if (_formKey.currentState.validate()) {
        walletStore.onChangedAmountValue(amountController.text);
      } else {
        walletStore.onChangedAmountValue('');
      }
    });

    return SafeArea(
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(35.0),
                  color: Theme.of(context).backgroundColor,
                  child: Column(
                    children: <Widget>[
                      Observer(builder: (_) {
                        return Row(
                          children: <Widget>[
                            Spacer(
                              flex: 1,
                            ),
                            Flexible(
                                flex: 2,
                                child: AspectRatio(
                                  aspectRatio: 1.0,
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    color: Colors.white,
                                    child: QrImage(
                                      data: walletStore.subaddress.address +
                                          walletStore.amountValue,
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                )),
                            Spacer(
                              flex: 1,
                            )
                          ],
                        );
                      }),
                      Observer(builder: (_) {
                        return Row(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.all(20.0),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                        text: walletStore.subaddress.address));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        S.of(context).copied_to_clipboard,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.green,
                                    ));
                                  },
                                  child: Text(
                                    walletStore.subaddress.address,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6
                                            .color),
                                  ),
                                ),
                              ),
                            ))
                          ],
                        );
                      }),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Form(
                                  key: _formKey,
                                  child: OxenTextField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(
                                          RegExp('[\\-|\\ |\\,]'))
                                    ],
                                    hintText: S.of(context).amount,
                                    validator: (value) {
                                      walletStore.validateAmount(value);
                                      return walletStore.errorMessage;
                                    },
                                    controller: amountController,
                                  )))
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      color: Theme.of(context).accentTextTheme.headline5.color,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              S.of(context).subaddresses,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .headline5
                                      .color),
                            ),
                            trailing: Container(
                              width: 28.0,
                              height: 28.0,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).selectedRowColor,
                                  shape: BoxShape.circle),
                              child: InkWell(
                                onTap: () => Navigator.of(context)
                                    .pushNamed(Routes.newSubaddress),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14.0)),
                                child: Icon(
                                  Icons.add,
                                  color: OxenPalette.teal,
                                  size: 22.0,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Theme.of(context).dividerTheme.color,
                            height: 1.0,
                          )
                        ],
                      ),
                    ))
                  ],
                ),
                Observer(builder: (_) {
                  return ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: subaddressListStore.subaddresses.length,
                      separatorBuilder: (context, i) {
                        return Divider(
                          color: Theme.of(context).dividerTheme.color,
                          height: 1.0,
                        );
                      },
                      itemBuilder: (context, i) {
                        return Observer(builder: (_) {
                          final subaddress =
                              subaddressListStore.subaddresses[i];
                          final isCurrent = walletStore.subaddress.address ==
                              subaddress.address;
                          final label = subaddress.label.isNotEmpty
                              ? subaddress.label
                              : subaddress.address;

                          return InkWell(
                            onTap: () => walletStore.setSubaddress(subaddress),
                            child: Container(
                              color: isCurrent ? currentColor : notCurrentColor,
                              child: Column(children: <Widget>[
                                ListTile(
                                  title: Text(
                                    label,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Theme.of(context)
                                            .primaryTextTheme
                                            .headline5
                                            .color),
                                  ),
                                )
                              ]),
                            ),
                          );
                        });
                      });
                })
              ],
            ))));
  }
}
