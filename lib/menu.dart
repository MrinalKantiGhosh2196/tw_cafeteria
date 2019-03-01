import 'package:flutter/material.dart';
import 'package:tw_cafeteria/constants/menuitems.dart';
import 'package:tw_cafeteria/constants/meal.dart';

class Menu extends StatelessWidget{
  Meal mealType;
  Menu(this.mealType);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: menuItems[mealType].map((String item){
        return new ListTile(title: new Text(item));
      }).toList()
    );
  }
}