import 'package:yahaal_test/models/recipe.dart';

abstract class RecipeService {
  Future<Recipe>fetchRecipes();
  Future<Recipe>findRecipeByName(String name);
}