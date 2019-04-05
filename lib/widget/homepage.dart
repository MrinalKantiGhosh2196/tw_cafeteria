import 'package:flutter/material.dart';
import 'package:tw_cafeteria/constants/constant_texts.dart';
import 'package:tw_cafeteria/widget/menu_view.dart';
import 'package:tw_cafeteria/model/meal_type.dart';
import 'package:tw_cafeteria/model/meals.dart';
import 'package:tw_cafeteria/service/time_provider_service.dart';
import 'package:tw_cafeteria/constants/style.dart';

class Homepage extends StatelessWidget {
  TimeProvider timeProvider;
  Homepage(this.timeProvider);

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      key: Key("homepage"),
      length: meals.length,
      initialIndex: _getTabIndexWithRespectToTime(),
      child: new Scaffold(
        appBar: new AppBar(
          title: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text(
              ConstantText.appTitle,
            ),
            new Row(
              children: <Widget>[
                new MaterialButton(
                    child: new Text(
                      ConstantText.adminLoginText,
                      style: Style.paragraphWhite,
                    ),
                    onPressed: () => Navigator.pushNamed(context, "/login")
                ),
                new IconButton(
                  icon: Icon(Icons.camera),
                  onPressed: () => Navigator.pushNamed(context, "/imageUpload")
                )
              ],
            )
          ],
        ),
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