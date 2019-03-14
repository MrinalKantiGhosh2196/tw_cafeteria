import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tw_cafeteria/model/meal_type.dart';

void main(){
  test("should return startTime in 11:00:00", (){
    DateTime currentTime = DateTime.now();
    MealType mealType = new MealType("DummyBreakfast", TimeOfDay(hour: 11), Duration(hours: 3));

    expect(mealType.getStartDateTime(), DateTime(currentTime.year,currentTime.month,
        currentTime.day, 11));
  });

  test("should return startTime in 21:00:00", (){
    DateTime currentTime = DateTime.now();
    MealType mealType = new MealType("DummyBreakfast", TimeOfDay(hour: 21), Duration(hours: 3));

    expect(mealType.getStartDateTime(), DateTime(currentTime.year,currentTime.month,
        currentTime.day, 21));
  });

  test("should return endTime as 14:00:00", () {
    DateTime currentTime = DateTime.now();
    MealType mealType = new MealType("DummyBreakfast", TimeOfDay(hour: 11), Duration(hours: 3));

    expect(mealType.getEndDateTime(), DateTime(currentTime.year, currentTime.month,
        currentTime.day, 14));
  });

  test("should return endTime as 01:00:00 of the next day", (){
    DateTime currentTime = DateTime.now();
    MealType mealType = new MealType("DummyBreakfast", TimeOfDay(hour: 15), Duration(hours: 10));

    expect(mealType.getEndDateTime(), DateTime(currentTime.year, currentTime.month,
        currentTime.day+1, 1));
  });
}