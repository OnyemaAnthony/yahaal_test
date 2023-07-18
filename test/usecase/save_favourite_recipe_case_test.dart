import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yahaal_test/repository/recipe/recipe_repository.dart';
import 'package:yahaal_test/usecase/recipe/find_recipe_by_id_case.dart';
import 'package:yahaal_test/usecase/recipe/save_favourite_recipe_case.dart';
import '../fakes/models/fake_recipe.dart';
import '../fakes/models/fake_recipe_info.dart';
import '../repository/recipe_repository_test.mocks.dart';

void main(){

  late RecipeRepository recipeRepository;
  late SaveFavouriteRecipeCase saveFavouriteRecipeCase;


  test('save Favourite recipe case recipes by Id case- verify that the repo layer is being called', () async {
    recipeRepository = MockRecipeRepository();
    saveFavouriteRecipeCase = SaveFavouriteRecipeCase(recipeRepository);

    final recipes = fakeRecipe;

    when(recipeRepository.saveFavouriteRecipe(recipes.results![0])).thenAnswer((realInvocation) async=> Right(recipes));

    final response = await saveFavouriteRecipeCase.call(recipes.results![0]);
    expect(response.isRight(), true);

    verify(recipeRepository.saveFavouriteRecipe(recipes.results![0]));
  });
}