import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yahaal_test/repository/recipe/recipe_repository.dart';
import 'package:yahaal_test/repository/recipe/recipe_repository_impl.dart';
import 'package:yahaal_test/services/recipe/recipe_service.dart';
import '../fakes/models/fake_recipe.dart';
import '../fakes/models/fake_recipe_info.dart';
import 'recipe_repository_test.mocks.dart';

@GenerateMocks([RecipeService, RecipeRepository])
void main() {

  late RecipeRepository recipeRepository;
  late RecipeService recipeService;
  group('Recipe Test', (){

    test('Fetch Recipes test - verify that the  service layer is called', ()async{

      recipeService = MockRecipeService();
      recipeRepository = RecipeRepositoryImpl(recipeService);

      final recipe = fakeRecipe;

      when(recipeService.fetchRecipes()).thenAnswer((realInvocation)async => recipe);
      final expected = await recipeRepository.fetchRecipes();
      expect(expected.isRight(),true);

      final result = expected.fold((l) {}, (r) =>r);
      verify(recipeService.fetchRecipes());
    });


    test('Fetch Favourite Recipes Test - verify if the service layer is called', () async {
      recipeService = MockRecipeService();
      recipeRepository = RecipeRepositoryImpl(recipeService);

      final recipes = fakeRecipe;

      when(recipeService.fetchFavouriteRecipe()).thenAnswer((realInvocation)async =>recipes);

      final expected = await recipeRepository.fetchFavouriteRecipe();
      expect(expected.isRight(), true);

      final result = expected.fold((l) {}, (r) => r);

      verify(recipeService.fetchFavouriteRecipe());
      expect(recipes.number, result!.number);

    });
    test('Save favourite recipe - verify service layer is being called', () async {
      recipeService = MockRecipeService();
      recipeRepository = RecipeRepositoryImpl(recipeService);

      final recipe = fakeRecipe;


      when(recipeService.saveFavouriteRecipe(recipe.results![0])).thenAnswer((realInvocation) async=> recipe.results![0]);

      final expected = await recipeRepository.saveFavouriteRecipe(recipe.results![0]);

      expect(expected.isLeft(), false);
      verify(recipeService.saveFavouriteRecipe(recipe.results![0]));
    });

    test('Find recipe by name favourite recipe - verify service layer is being called', () async {
      recipeService = MockRecipeService();
      recipeRepository = RecipeRepositoryImpl(recipeService);

      final recipe = fakeRecipe;


      when(recipeService.findRecipeByName("pasta")).thenAnswer((realInvocation) async=> recipe);

      final expected = await recipeRepository.findRecipeByName("pasta");

      expect(expected.isLeft(), false);
      verify(recipeService.findRecipeByName("pasta"));
    });

    test('Find recipe by Id favourite recipe - verify service layer is being called', () async {
      recipeService = MockRecipeService();
      recipeRepository = RecipeRepositoryImpl(recipeService);
      String recipeId = "766453";

      final recipe = fakeRecipeInfo;


      when(recipeService.findRecipeById(recipeId)).thenAnswer((realInvocation) async=> recipe);

      final expected = await recipeRepository.findRecipeById(recipeId);

      expect(expected.isLeft(), false);
      verify(recipeService.findRecipeById(recipeId));
    });

  });
}