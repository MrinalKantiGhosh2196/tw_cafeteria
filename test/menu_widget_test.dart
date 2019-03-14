import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tw_cafeteria/widget/menu.dart';
import 'package:tw_cafeteria/model/meal_type.dart';
import 'package:tw_cafeteria/model/meals.dart';

void main(){
  testWidgets("Should have necessary widgets", (WidgetTester tester) async{
    MealType mealType = MealType.breakfast;
    int numberOfDishes = meals[mealType].length;

    await tester.pumpWidget(new Menu(mealType));
    

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(numberOfDishes));
  });
}