class IngredientEntity {
  String? unit;
  double? amount;
  String? ingredient;

  IngredientEntity({
    this.unit,
    this.amount,
    this.ingredient,
  });

  factory IngredientEntity.fromJson(Map<String, dynamic> json) {
    return IngredientEntity(
      unit: json['unit'],
      amount: json['amount'].runtimeType == int ? json['amount'].toDouble() : json['amount'],
      ingredient: json['ingredient'],
    );
  }

  Map<String, dynamic> toJson() => {
        "unit": unit,
        "amount": amount,
        "ingredient": ingredient,
      }..removeWhere((key, value) => value == null);
}
