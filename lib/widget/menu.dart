import 'package:flutter/material.dart';
import 'package:tw_cafeteria/model/meals.dart';
import 'package:tw_cafeteria/model/meal_type.dart';

class Menu extends StatelessWidget{
  MealType mealType;
  Menu(this.mealType);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new ListView(
        children: meals[mealType].map((String item){
          return new ListTile(title: new Text(item));
        }).toList()
      )
      )
    );
  }
}