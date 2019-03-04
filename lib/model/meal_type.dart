class MealType{
  final String _name;
  const MealType(this._name);

  String get name => _name;

  static const breakfast = const MealType("Breakfast");
  static const lunch = const MealType("Lunch");
  static const snacks = const MealType("Snacks");
}
