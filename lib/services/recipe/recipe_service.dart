import 'package:yahaal_test/models/recipe.dart';
import 'package:yahaal_test/models/recipe_info.dart';

abstract class RecipeService {
  Future<Recipe>fetchRecipes();
  Future<Recipe>findRecipeByName(String name);
  Future<RecipeInfo>findRecipeById(String id);
  Future<void>saveFavouriteRecipe(Results recipe);
  Future<Recipe>fetchFavouriteRecipe();
}