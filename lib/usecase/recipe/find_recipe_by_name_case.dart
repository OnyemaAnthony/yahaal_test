import 'package:yahaal_test/models/recipe.dart';
import 'package:dartz/dartz.dart';
import '../../di/injection.dart';
import '../../repository/recipe/recipe_repository.dart';
import '../../utils/api_request_failure.dart';
import '../use_case.dart';

class FindRecipeByNameCase with  UseCases<Either<ApiRequestFailure, Recipe>, String>{
  final RecipeRepository recipeRepository;

  FindRecipeByNameCase(this.recipeRepository);
  @override
  Future<Either<ApiRequestFailure, Recipe>> call(String params) {
    return recipeRepository.findRecipeByName(params);
  }
  static FindRecipeByNameCase get it =>getIt<FindRecipeByNameCase>();
}