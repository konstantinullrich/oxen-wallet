import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:oxen_wallet/generated/l10n.dart';
import 'package:oxen_wallet/src/screens/base_page.dart';
import 'package:oxen_wallet/src/stores/subaddress_creation/subaddress_creation_state.dart';
import 'package:oxen_wallet/src/stores/subaddress_creation/subaddress_creation_store.dart';
import 'package:oxen_wallet/src/widgets/oxen_text_field.dart';
import 'package:oxen_wallet/src/widgets/primary_button.dart';
import 'package:oxen_wallet/src/widgets/scollable_with_bottom_section.dart';
import 'package:provider/provider.dart';

class NewSubaddressPage extends BasePage {
  @override
  String get title => S.current.new_subaddress_title;

  @override
  Widget body(BuildContext context) => NewSubaddressForm();

  @override
  Widget build(BuildContext context) {
    final subaddressCreationStore =
        Provider.of<SubadrressCreationStore>(context);

    reaction((_) => subaddressCreationStore.state,
        (SubaddressCreationState state) {
      if (state is SubaddressCreatedSuccessfully) {
        WidgetsBinding.instance
            .addPostFrameCallback((_) => Navigator.of(context).pop());
      }
    });

    return super.build(context);
  }
}

class NewSubaddressForm extends StatefulWidget {
  @override
  NewSubaddressFormState createState() => NewSubaddressFormState();
}

class NewSubaddressFormState extends State<NewSubaddressForm> {
  final _formKey = GlobalKey<FormState>();
  final _labelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final subaddressCreationStore =
        Provider.of<SubadrressCreationStore>(context);

    return ScrollableWithBottomSection(
      contentPadding: EdgeInsets.all(20),
      content: Form(
          key: _formKey,
          child: Stack(children: <Widget>[
            Center(
              child: OxenTextField(
                  controller: _labelController,
                  hintText: S.of(context).new_subaddress_label_name,
                  validator: (value) {
                    subaddressCreationStore.validateSubaddressName(value);
                    return subaddressCreationStore.errorMessage;
                  }),
            ),
          ])),
      bottomSection: Observer(
        builder: (_) => LoadingPrimaryButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                await subaddressCreationStore.add(label: _labelController.text);
                Navigator.of(context).pop();
              }
            },
            text: S.of(context).new_subaddress_create,
            color: Theme.of(context).accentTextTheme.button.backgroundColor,
            borderColor:
                Theme.of(context).accentTextTheme.button.decorationColor,
            isLoading: subaddressCreationStore.state is SubaddressIsCreating),
      ),
    );
  }
}
