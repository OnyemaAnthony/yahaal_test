import '../../di/injection.dart';
import '../../models/recipe.dart';
import '../../repository/recipe/recipe_repository.dart';
import 'package:dartz/dartz.dart';
import '../../utils/api_request_failure.dart';
import '../use_case.dart';

class GetFavouriteRecipeCase with NoParamUseCases<Either<ApiRequestFailure,Recipe>>{
  final RecipeRepository _recipeRepository;

  GetFavouriteRecipeCase(this._recipeRepository);
  @override
  Future<Either<ApiRequestFailure, Recipe>> call() {
    return _recipeRepository.fetchFavouriteRecipe();
  }
  static GetFavouriteRecipeCase get it =>getIt<GetFavouriteRecipeCase>();
}