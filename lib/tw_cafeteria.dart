import 'package:flutter/material.dart';
import 'package:tw_cafeteria/constants/constant_texts.dart';
import 'package:tw_cafeteria/menu.dart';
import 'package:tw_cafeteria/constants/meals.dart';

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
              tabs: meals.map((String mealType) {
                return new Tab(text: mealType);
              }).toList()
            ),
          ),
          body: new TabBarView(
            children: meals.map((String mealType) {
              return new Menu(mealType);
            }).toList(),
          ),
        )
      )
    );
  }
}
