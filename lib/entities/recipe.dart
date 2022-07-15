import 'ingredient.dart';

class RecipeEntity {
  String? name;
  String? glass;
  String? category;
  String? garnish;
  String? preparation;
  List<IngredientEntity>? ingredients;

  RecipeEntity({
    this.name,
    this.glass,
    this.category,
    this.garnish,
    this.preparation,
    this.ingredients,
  });

  factory RecipeEntity.fromJson(Map<String, dynamic> json) {
    return RecipeEntity(
      name: json['name'],
      glass: json['glass'],
      category: json['category'],
      garnish: json['garnish'],
      preparation: json['preparation'],
      ingredients: json['ingredients'] == null
          ? null
          : (json['ingredients'] as List).map((e) => IngredientEntity.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "glass": glass,
        "category": category,
        "garnish": garnish,
        "preparation": preparation,
        "ingredients": ingredients?.map((e) => e.toJson()).toList(),
      }..removeWhere((key, value) => value == null);
}
