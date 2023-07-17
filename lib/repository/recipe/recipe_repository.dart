
import 'package:yahaal_test/models/recipe.dart';
import 'package:dartz/dartz.dart';
import '../../utils/api_request_failure.dart';

abstract class RecipeRepository{
  Future<Either<ApiRequestFailure, Recipe>>fetchRecipes();
  Future<Either<ApiRequestFailure, Recipe>>findRecipeByName(String name);
}