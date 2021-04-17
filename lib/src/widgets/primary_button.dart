import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxen_wallet/palette.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {@required this.onPressed,
      @required this.text,
      @required this.color,
      @required this.borderColor,
      this.isDisabled = false,
      this.onDisabledPressed});

  final VoidCallback onPressed;
  final VoidCallback onDisabledPressed;
  final Color color;
  final Color borderColor;
  final String text;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isDisabled ? onDisabledPressed : onPressed,
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(double.infinity, 56)),
          backgroundColor: MaterialStateProperty.all(
              isDisabled ? Colors.transparent : color),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(10.0)))),
      child: Text(text,
          style: TextStyle(
              fontSize: 16.0,
              color: isDisabled
                  ? Palette.darkGrey
                  : Theme.of(context).primaryTextTheme.button.color)),
    );
  }
}

class LoadingPrimaryButton extends StatelessWidget {
  const LoadingPrimaryButton(
      {@required this.onPressed,
      @required this.text,
      @required this.color,
      @required this.borderColor,
      this.isDisabled = false,
      this.isLoading = false});

  final VoidCallback onPressed;
  final Color color;
  final Color borderColor;
  final bool isLoading;
  final bool isDisabled;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (isLoading || isDisabled) ? null : onPressed,
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(double.infinity, 56)),
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(10.0)))),
      child: isLoading
          ? CupertinoActivityIndicator(animating: true)
          : Text(text,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context).primaryTextTheme.button.color)),
    );
  }
}

class PrimaryIconButton extends StatelessWidget {
  const PrimaryIconButton({
    @required this.onPressed,
    @required this.iconData,
    @required this.text,
    @required this.color,
    @required this.borderColor,
    @required this.iconColor,
    @required this.iconBackgroundColor,
  });

  final VoidCallback onPressed;
  final IconData iconData;
  final Color color;
  final Color borderColor;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(double.infinity, 56)),
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(10.0)))),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 28),
            width: 28.0,
            height: 56.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: iconBackgroundColor),
            child: Icon(iconData, color: iconColor, size: 22.0),
          ),
          Container(
            height: 56.0,
            child: Center(
              child: Text(text,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).primaryTextTheme.button.color)),
            ),
          )
        ],
      ),
    );
  }
}
