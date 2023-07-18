import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yahaal_test/repository/recipe/recipe_repository.dart';
import 'package:yahaal_test/usecase/recipe/find_recipe_by_name_case.dart';
import '../fakes/models/fake_recipe.dart';
import '../repository/recipe_repository_test.mocks.dart';

void main(){

  late RecipeRepository recipeRepository;
  late FindRecipeByNameCase findRecipeByNameCase;


  test('find recipes by name case- verify that the repo layer is being called', () async {
    recipeRepository = MockRecipeRepository();
    findRecipeByNameCase = FindRecipeByNameCase(recipeRepository);
    String recipeName = "pasta";

    final recipes = fakeRecipe;

    when(recipeRepository.findRecipeByName(recipeName)).thenAnswer((realInvocation) async=> Right(recipes));

    final response = await findRecipeByNameCase.call(recipeName);
    expect(response.isLeft(), false);

    verify(recipeRepository.findRecipeByName(recipeName));
  });
}