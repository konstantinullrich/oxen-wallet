import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oxen_wallet/generated/l10n.dart';
import 'package:oxen_wallet/src/widgets/primary_button.dart';

Future showOxenDialog(BuildContext context, Widget child,
    {VoidCallback onDismiss}) {
  return showDialog<void>(
      builder: (_) => OxenDialog(body: child, onDismiss: onDismiss),
      context: context);
}

Future showSimpleOxenDialog(BuildContext context, String title, String body,
    {void Function(BuildContext context) onPressed, VoidCallback onDismiss}) {
  return showDialog<void>(
      builder: (_) => SimpleOxenDialog(title, body,
          onDismiss: onDismiss, onPressed: onPressed),
      context: context);
}

class OxenDialog extends StatelessWidget {
  OxenDialog({this.body, this.onDismiss});

  final VoidCallback onDismiss;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onDismiss ?? Navigator.of(context).pop(),
      child: Container(
        color: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.55)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: body),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SimpleOxenDialog extends StatelessWidget {
  SimpleOxenDialog(this.title, this.body, {this.onPressed, this.onDismiss});

  final String title;
  final String body;
  final void Function(BuildContext context) onPressed;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return OxenDialog(
        onDismiss: onDismiss,
        body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(title,
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
                  child: Text(body,
                      style: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .caption
                              .color))),
              PrimaryButton(
                  text: S.of(context).ok,
                  color:
                      Theme.of(context).primaryTextTheme.button.backgroundColor,
                  borderColor:
                      Theme.of(context).primaryTextTheme.button.decorationColor,
                  onPressed: () {
                    if (onPressed != null) onPressed(context);
                  })
            ],
          ),
        ));
  }
}
