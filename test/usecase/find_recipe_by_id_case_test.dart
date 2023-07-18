import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yahaal_test/repository/recipe/recipe_repository.dart';
import 'package:yahaal_test/usecase/recipe/find_recipe_by_id_case.dart';
import '../fakes/models/fake_recipe_info.dart';
import '../repository/recipe_repository_test.mocks.dart';

void main(){

  late RecipeRepository recipeRepository;
  late FindRecipeByIdCase findRecipeByIdCase;


  test('fid recipes by Id case- verify that the repo layer is being called', () async {
    recipeRepository = MockRecipeRepository();
    findRecipeByIdCase = FindRecipeByIdCase(recipeRepository);
    String recipeId = "766453";


    final recipes = fakeRecipeInfo;

    when(recipeRepository.findRecipeById(recipeId)).thenAnswer((realInvocation) async=> Right(recipes));

    final response = await findRecipeByIdCase.call(recipeId);
    expect(response.isRight(), true);

    verify(recipeRepository.findRecipeById(recipeId));
  });
}