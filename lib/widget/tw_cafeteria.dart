import 'package:flutter/material.dart';
import 'package:tw_cafeteria/constants/constant_texts.dart';
import 'package:tw_cafeteria/widget/menu.dart';
import 'package:tw_cafeteria/model/meal_type.dart';
import 'package:tw_cafeteria/model/meals.dart';

class TwCafeteria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: meals.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Center(
              child: new Text(ConstantText.appTitle),
            ),
            bottom: new TabBar(
              tabs: meals.keys.map((MealType mealType) {
                return new Tab(text: mealType.name);
              }).toList()
            ),
          ),
          body: new TabBarView(
            children: meals.keys.map((MealType mealType) {
              return new Menu(mealType);
            }).toList(),
          ),
        )
      )
    );
  }
}
