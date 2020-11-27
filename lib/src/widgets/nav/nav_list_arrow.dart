import 'package:flutter/material.dart';

class NavListArrow extends StatelessWidget {
  NavListArrow({this.text, this.leading, this.onTap});

  final String text;
  final Widget leading;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentTextTheme.headline5.backgroundColor,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
        leading: leading,
        title: Text(text,
            style: TextStyle(
                fontSize: 16.0,
                color: Theme.of(context).primaryTextTheme.headline6.color)),
        trailing: Icon(Icons.arrow_forward_ios_rounded,
            color: Theme.of(context).primaryTextTheme.headline6.color,
            size: 20),
        onTap: onTap,
      ),
    );
  }
}
