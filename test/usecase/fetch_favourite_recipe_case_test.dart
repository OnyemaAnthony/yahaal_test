import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yahaal_test/repository/recipe/recipe_repository.dart';
import 'package:yahaal_test/usecase/recipe/get_favourite_recipe_case.dart';

import '../fakes/models/fake_recipe.dart';
import '../repository/recipe_repository_test.mocks.dart';

void main(){

  late RecipeRepository recipeRepository;
  late GetFavouriteRecipeCase getFavouriteRecipeCase;


  test('fetch favourite recipes case - verify that the repo layer is being called', () async {
    recipeRepository = MockRecipeRepository();
    getFavouriteRecipeCase = GetFavouriteRecipeCase(recipeRepository);


    final recipes = fakeRecipe;

    when(recipeRepository.fetchFavouriteRecipe()).thenAnswer((realInvocation) async=> Right(recipes));

    final response = await getFavouriteRecipeCase.call();
    expect(response.isRight(), true);

    verify(recipeRepository.fetchFavouriteRecipe());
  });
}