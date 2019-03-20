import 'package:flutter/material.dart';
import 'package:tw_cafeteria/constants/constant_texts.dart';
import 'package:tw_cafeteria/widget/menu_view.dart';
import 'package:tw_cafeteria/model/meal_type.dart';
import 'package:tw_cafeteria/model/meals.dart';
import 'package:tw_cafeteria/service/time_provider_service.dart';

class TwCafeteria extends StatelessWidget {
  TimeProvider timeProvider;
  TwCafeteria(this.timeProvider);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: ConstantText.appTitle,
      home: new DefaultTabController(
        length: meals.length,
        initialIndex: _getTabIndexWithRespectToTime(),
        child: new Scaffold(
          appBar: new AppBar(
            centerTitle: true,
            title: new Text(ConstantText.appTitle),
            bottom: new TabBar(
              tabs: meals.keys.map((MealType mealType) {
                return new Tab(text: mealType.name);
              }).toList()
            ),
          ),
          body: new TabBarView(
            children: meals.keys.map((MealType mealType) {
              return new MenuView(meals[mealType]);
            }).toList(),
          ),
        )
      )
    );
  }


  int _getTabIndexWithRespectToTime() {
    int index = 0;
    DateTime currentTime = timeProvider.getCurrentTime();
    for(MealType mealType in meals.keys) {
      if(currentTime.isAfter(mealType.getStartDateTime()) &&
          (currentTime.isBefore(mealType.getEndDateTime()) || currentTime == mealType.getEndDateTime())){
        return index;
      }
      index++;
    }
  }

}