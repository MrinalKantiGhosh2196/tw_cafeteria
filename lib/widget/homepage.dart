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
                  onPressed: () => onTappedCamera(context)
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

  Future<void> onTappedCamera(BuildContext context) {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      child: new Text('Take a picture'),
                      onTap: null,
                    ),
                  ),
                  new Container(
                    padding: EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      child: new Text('Select from gallery'),
                      onTap: null,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}