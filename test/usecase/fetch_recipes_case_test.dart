import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yahaal_test/repository/recipe/recipe_repository.dart';
import 'package:yahaal_test/usecase/recipe/get_favourite_recipe_case.dart';
import 'package:yahaal_test/usecase/recipe/get_recipes_case.dart';

import '../fakes/models/fake_recipe.dart';
import '../repository/recipe_repository_test.mocks.dart';

void main(){

  late RecipeRepository recipeRepository;
  late GetRecipes getRecipes;


  test('fetch recipes case- verify that the repo layer is being called', () async {
    recipeRepository = MockRecipeRepository();
    getRecipes = GetRecipes(recipeRepository);


    final recipes = fakeRecipe;

    when(recipeRepository.fetchRecipes()).thenAnswer((realInvocation) async=> Right(recipes));

    final response = await getRecipes.call();
    expect(response.isRight(), true);

    verify(recipeRepository.fetchRecipes());
  });
}