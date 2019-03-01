import 'package:tw_cafeteria/constants/meal.dart';

final List<String> breakfast = <String>["Poha","Omlette","Sandwich","Paratha", "Cornflakes", "Juice", "Half-Fried Omlette", "Pasta"];
final List<String> lunch = <String>["Salad", "Onion", "Papad", "Rice", "Biriyani", "Paneer", "Manchurian", "Pulao", "Fried Rice", "Paratha", "Chapati", "Ras malai", "Rasgulla", "Pav Bhaji", "Chhola", "Sarsho ka sag", "Makki Roti", "Chicken Curry", "Egg Curry", "Paneer Pakoda", "Macroni"];
final List<String> snacks = <String>["Juice", "Chowmien", "Samosa"] ;

final Map<Meal, List<String>> menuItems = <Meal, List<String>> {
  const Meal("Breakfast") : breakfast,
  const Meal("Lunch") : lunch,
  const Meal("Snacks") : snacks
};