import 'package:flutter/material.dart';
import 'package:tw_cafeteria/model/meals.dart';
import 'package:tw_cafeteria/model/meal_type.dart';

class MenuView extends StatelessWidget{
  List<String> menu;
  MenuView(this.menu);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: menu.map((String menuItem){
        return new ListTile(title: new Text(menuItem));
      }).toList()
    );
  }
}