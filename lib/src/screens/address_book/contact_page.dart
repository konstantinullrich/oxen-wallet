import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxen_wallet/generated/l10n.dart';
import 'package:oxen_wallet/src/domain/common/contact.dart';
import 'package:oxen_wallet/src/domain/common/crypto_currency.dart';
import 'package:oxen_wallet/src/screens/base_page.dart';
import 'package:oxen_wallet/src/stores/address_book/address_book_store.dart';
import 'package:oxen_wallet/src/widgets/address_text_field.dart';
import 'package:oxen_wallet/src/widgets/oxen_dialog.dart';
import 'package:oxen_wallet/src/widgets/oxen_text_field.dart';
import 'package:oxen_wallet/src/widgets/primary_button.dart';
import 'package:oxen_wallet/src/widgets/scollable_with_bottom_section.dart';
import 'package:provider/provider.dart';

class ContactPage extends BasePage {
  ContactPage({this.contact});

  final Contact contact;

  @override
  String get title => S.current.contact;

  @override
  Widget body(BuildContext context) => ContactForm(contact);
}

class ContactForm extends StatefulWidget {
  ContactForm(this.contact);

  final Contact contact;

  @override
  State<ContactForm> createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _contactNameController = TextEditingController();
  final _currencyTypeController = TextEditingController();
  final _addressController = TextEditingController();

  CryptoCurrency _selectedCrypto = CryptoCurrency.oxen;

  @override
  void initState() {
    super.initState();
    if (widget.contact == null) {
      _currencyTypeController.text = _selectedCrypto.toString();
    } else {
      _selectedCrypto = widget.contact.type;
      _contactNameController.text = widget.contact.name;
      _currencyTypeController.text = _selectedCrypto.toString();
      _addressController.text = widget.contact.address;
    }
  }

  @override
  void dispose() {
    _contactNameController.dispose();
    _currencyTypeController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _setCurrencyType(BuildContext context) async {
    var currencyType = CryptoCurrency.all[0].toString();
    var selectedCurrency = CryptoCurrency.all[0];

    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return OxenDialog(
              body: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(S.of(context).please_select,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            color: Theme.of(context)
                                .primaryTextTheme
                                .caption
                                .color))),
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 30),
                  child: Container(
                    height: 150.0,
                    child: CupertinoPicker(
                        backgroundColor: Theme.of(context).backgroundColor,
                        itemExtent: 45.0,
                        onSelectedItemChanged: (int index) {
                          selectedCurrency = CryptoCurrency.all[index];
                          currencyType = CryptoCurrency.all[index].toString();
                        },
                        children: List.generate(CryptoCurrency.all.length,
                            (int index) {
                          return Center(
                            child: Text(
                              CryptoCurrency.all[index].toString(),
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .caption
                                      .color),
                            ),
                          );
                        })),
                  ),
                ),
                PrimaryButton(
                  text: S.of(context).ok,
                  color:
                      Theme.of(context).primaryTextTheme.button.backgroundColor,
                  borderColor:
                      Theme.of(context).primaryTextTheme.button.decorationColor,
                  onPressed: () {
                    _selectedCrypto = selectedCurrency;
                    _currencyTypeController.text = currencyType;
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    final addressBookStore = Provider.of<AddressBookStore>(context);

    return ScrollableWithBottomSection(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              OxenTextField(
                hintText: S.of(context).contact_name,
                controller: _contactNameController,
                validator: (value) {
                  addressBookStore.validateContactName(value);
                  return addressBookStore.errorMessage;
                },
              ),
              SizedBox(height: 14.0),
              Container(
                child: InkWell(
                  onTap: () => _setCurrencyType(context),
                  child: IgnorePointer(
                    child: OxenTextField(
                      controller: _currencyTypeController,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14.0),
              AddressTextField(
                controller: _addressController,
                options: [AddressTextFieldOption.qrCode],
                validator: (value) {
                  addressBookStore.validateAddress(value,
                      cryptoCurrency: _selectedCrypto);
                  return addressBookStore.errorMessage;
                },
              )
            ],
          ),
        ),
        bottomSection: Row(
          children: <Widget>[
            Expanded(
              child: PrimaryButton(
                  onPressed: () {
                    setState(() {
                      _selectedCrypto = CryptoCurrency.xmr;
                      _contactNameController.text = '';
                      _currencyTypeController.text = _selectedCrypto.toString();
                      _addressController.text = '';
                    });
                  },
                  text: S.of(context).reset,
                  color:
                      Theme.of(context).accentTextTheme.button.backgroundColor,
                  borderColor:
                      Theme.of(context).accentTextTheme.button.decorationColor),
            ),
            SizedBox(width: 20),
            Expanded(
                child: PrimaryButton(
                    onPressed: () async {
                      if (!_formKey.currentState.validate()) return;

                      try {
                        if (widget.contact == null) {
                          final newContact = Contact(
                              name: _contactNameController.text,
                              address: _addressController.text,
                              type: _selectedCrypto);

                          await addressBookStore.add(contact: newContact);
                        } else {
                          widget.contact.name = _contactNameController.text;
                          widget.contact.address = _addressController.text;
                          widget.contact
                              .updateCryptoCurrency(currency: _selectedCrypto);

                          await addressBookStore.update(
                              contact: widget.contact);
                        }
                        Navigator.pop(context);
                      } catch (e) {
                        await showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  e.toString(),
                                  textAlign: TextAlign.center,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Text(S.of(context).ok))
                                ],
                              );
                            });
                      }
                    },
                    text: S.of(context).save,
                    color: Theme.of(context)
                        .primaryTextTheme
                        .button
                        .backgroundColor,
                    borderColor: Theme.of(context)
                        .primaryTextTheme
                        .button
                        .decorationColor))
          ],
        ));
  }
}
