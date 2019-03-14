class MealType{
  final String _name;
  final int startTimeInHours;
  final int endTimeInHours;

  const MealType(this._name, this.startTimeInHours, this.endTimeInHours);
  String get name => _name;

  static const breakfast = const MealType("Breakfast", 18, 11);
  static const lunch = const MealType("Lunch", 11, 15);
  static const snacks = const MealType("Snacks", 15, 18);
}
