import 'package:yahaal_test/models/recipe_info.dart';
import 'package:dartz/dartz.dart';
import '../../di/injection.dart';
import '../../repository/recipe/recipe_repository.dart';
import '../../utils/api_request_failure.dart';
import '../use_case.dart';

class FindRecipeByIdCase with  UseCases<Either<ApiRequestFailure, RecipeInfo>, String>{
  final RecipeRepository recipeRepository;

  FindRecipeByIdCase(this.recipeRepository);
  @override
  Future<Either<ApiRequestFailure, RecipeInfo>> call(String params) {
    return recipeRepository.findRecipeById(params);
  }
  static FindRecipeByIdCase get it =>getIt<FindRecipeByIdCase>();
}