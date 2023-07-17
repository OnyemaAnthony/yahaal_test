import 'package:yahaal_test/models/recipe.dart';
import 'package:yahaal_test/repository/recipe/recipe_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../di/injection.dart';
import '../../../utils/api_request_failure.dart';
import '../use_case.dart';

class GetRecipes with NoParamUseCases<Either<ApiRequestFailure,Recipe>>{
  final RecipeRepository _recipeRepository;

  GetRecipes(this._recipeRepository);
  @override
  Future<Either<ApiRequestFailure, Recipe>> call() {
    return _recipeRepository.fetchRecipes();
  }
  static GetRecipes get it =>getIt<GetRecipes>();
}