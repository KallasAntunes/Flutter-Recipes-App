import 'package:get/get.dart';
import 'package:loka/entities/entities.dart';

import '../helpers/loading.dart';
import '../respositories/recipe.dart';
import '../ui/pages/recipe.dart';

class HomeController extends GetxController {
  HomeController() {
    _repository = RecipeRepository();
    getRecipes();
  }

  late RecipeRepository _repository;
  final _recipes = RxList(<RecipeEntity>[]);

  List<RecipeEntity> get recipes => _recipes;

  final _loadingStatus = LoadingStatus.completed.obs;

  LoadingStatus get loadingStatus => _loadingStatus.value;

  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  bool get isLoading => loadingStatus == LoadingStatus.loading;

  void getRecipes() {
    try {
      loadingStatus = LoadingStatus.loading;
      _repository.getAll().then((value) {
        _recipes.assignAll(value..sort((a, b) => (b.name ?? '').compareTo(a.name ?? '')));
        loadingStatus = LoadingStatus.completed;
      });
    } catch (e) {
      loadingStatus = LoadingStatus.error;
    }
  }

  void details(RecipeEntity item) => Get.to(() => RecipePage(item));
}
