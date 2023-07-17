import 'package:dartz/dartz.dart';
import 'package:yahaal_test/models/recipe.dart';
import 'package:yahaal_test/repository/recipe/recipe_repository.dart';
import 'package:yahaal_test/services/recipe/recipe_service.dart';
import 'package:yahaal_test/utils/api_interceptor.dart';
import 'package:yahaal_test/utils/api_request_failure.dart';

class RecipeRepositoryImpl extends RecipeRepository{
  final RecipeService _recipeService;

  RecipeRepositoryImpl(this._recipeService);
  @override
  Future<Either<ApiRequestFailure, Recipe>> fetchRecipes() {
    return apiInterceptor(() => _recipeService.fetchRecipes());
  }

  @override
  Future<Either<ApiRequestFailure, Recipe>> findRecipeByName(String name) {
    return apiInterceptor(() => _recipeService.findRecipeByName(name));
  }
}