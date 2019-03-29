import 'package:flutter/material.dart';

class BuildIconButton extends StatefulWidget{
  final IconData _icon;
  final double paddingLeft;
  final double paddingRight;
  final Color _colorOnTapped;
  final VoidCallback _onPressed;
  _BuildIconButtonState _buildIconButtonState;

  bool isTapped;

  BuildIconButton(this._icon, this._colorOnTapped, this._onPressed, this.isTapped, {this.paddingLeft = 0, this.paddingRight = 0});

  @override
  State<StatefulWidget> createState() {
    _buildIconButtonState = _BuildIconButtonState(_icon, _colorOnTapped, _onPressed ,isTapped, paddingRight: paddingRight, paddingLeft: paddingLeft);
    return _buildIconButtonState;
  }

  changeColor(Color color){
    _buildIconButtonState.changeColor(color);
  }

}

class _BuildIconButtonState extends State<BuildIconButton>{
  final IconData _icon;
  final double paddingLeft;
  final double paddingRight;
  Color _color;
  final VoidCallback _onPressed;
  bool _isTapped;

  _BuildIconButtonState(this._icon, this._color, this._onPressed ,this._isTapped, {this.paddingLeft = 0, this.paddingRight = 0});

  @override
  Widget build(BuildContext context) {
    return new IconButton(
      padding: EdgeInsets.only(left: paddingLeft, right: paddingRight),
      icon: new Icon(_icon),
      color: _color,
      disabledColor: Colors.grey,
      onPressed: ()=>{this._onPressed('dislike'),
    );
  }

  changeColor(Color color){
    setState(() {
      this._color = color;
    });
  }


}
