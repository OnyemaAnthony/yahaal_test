import 'package:yahaal_test/models/recipe.dart';
import 'package:dartz/dartz.dart';
import '../../di/injection.dart';
import '../../repository/recipe/recipe_repository.dart';
import '../../utils/api_request_failure.dart';
import '../use_case.dart';

class SaveFavouriteRecipeCase with  UseCases<Either<ApiRequestFailure, void>, Results>{
  final RecipeRepository recipeRepository;

  SaveFavouriteRecipeCase(this.recipeRepository);
  @override
  Future<Either<ApiRequestFailure, void>> call(Results params) {
    return recipeRepository.saveFavouriteRecipe(params);
  }
  static SaveFavouriteRecipeCase get it =>getIt<SaveFavouriteRecipeCase>();
}