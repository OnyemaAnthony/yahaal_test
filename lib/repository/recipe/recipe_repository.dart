
import 'package:yahaal_test/models/recipe.dart';
import 'package:dartz/dartz.dart';
import 'package:yahaal_test/models/recipe_info.dart';
import '../../utils/api_request_failure.dart';

abstract class RecipeRepository{
  Future<Either<ApiRequestFailure, Recipe>>fetchRecipes();
  Future<Either<ApiRequestFailure, Recipe>>findRecipeByName(String name);
  Future<Either<ApiRequestFailure, RecipeInfo>>findRecipeById(String id);
  Future<Either<ApiRequestFailure, void>>saveFavouriteRecipe(Results recipe);
  Future<Either<ApiRequestFailure, Recipe>>fetchFavouriteRecipe();
}