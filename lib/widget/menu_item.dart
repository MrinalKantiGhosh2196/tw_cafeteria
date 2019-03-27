import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget{
  final String _menuItem;

  MenuItem(this._menuItem);

  @override
  State<StatefulWidget> createState() {
    return new _MenuItemState(_menuItem);
  }
}

class _MenuItemState extends State<MenuItem>{
  final String _menuItem;

  _MenuItemState(this._menuItem);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(_menuItem),
      trailing: new Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _iconButton(new Icon(Icons.thumb_up), paddingRight: 10),
          _iconButton(new Icon(Icons.thumb_down), paddingLeft: 10),
        ],
      ),
    );
  }

  Widget _iconButton(Icon icon, {double paddingLeft = 0, double paddingRight = 0}) {
    return new Padding(
        padding: EdgeInsets.only(left: paddingLeft, right: paddingRight),
        child: icon
    );
  }
}