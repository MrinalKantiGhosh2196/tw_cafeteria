import 'package:flutter/material.dart';
import 'package:tw_cafeteria/constants/constant_texts.dart';
import 'package:tw_cafeteria/menu.dart';
import 'package:tw_cafeteria/constants/meal.dart';
import 'package:tw_cafeteria/constants/menuitems.dart';

class TwCafeteria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: menuItems.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Center(
              child: new Text(ConstantText.appTitle),
            ),
            bottom: new TabBar(
              tabs: menuItems.keys.map((Meal mealType) {
                return new Tab(text: mealType.name);
              }).toList()
            ),
          ),
          body: new TabBarView(
            children: menuItems.keys.map((Meal mealType) {
              return new Menu(mealType);
            }).toList(),
          ),
        )
      )
    );
  }
}
