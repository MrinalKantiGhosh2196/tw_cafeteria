import 'package:tw_cafeteria/model/meal_type.dart';
import 'package:tw_cafeteria/model/menus.dart';

final Map<MealType, List<String>> meals = <MealType, List<String>>{
  MealType.breakfast: breakfastMenu,
  MealType.lunch: lunchMenu,
  MealType.snacks: snacksMenu
};
