import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:loka/entities/entities.dart';

class RecipeRepository {
  RecipeRepository();

  Future<List<RecipeEntity>> getAll() async {
    try {
      final response = await http.get(
        Uri.parse('https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json'),
      );

      final data = jsonDecode(response.body) as List;

      final list = data.map((e) => RecipeEntity.fromJson(e)).toList();

      return list;
    } on HttpResponse catch (_) {
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
