import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yahaal_test/models/recipe.dart';
import 'package:yahaal_test/models/recipe_info.dart';
import 'package:yahaal_test/services/recipe/recipe_service.dart';
import 'package:yahaal_test/utils/api_key.dart';
import 'package:yahaal_test/utils/base_api.dart';
import 'package:yahaal_test/utils/utilities.dart';

class RecipeServiceImpl extends BaseApi implements RecipeService{
  final logger = Logger();

  @override
  Future<Recipe> fetchRecipes() async{
    final response = await get(ApiKey.recipeEndpoint);
    return Recipe.fromJson(response);
  }

  @override
  Future<Recipe> findRecipeByName(String name) async{
    Map<String,dynamic> query = {'query':name};
    final response = await get(ApiKey.recipeEndpoint,query: query);
    return Recipe.fromJson(response);
  }

  @override
  Future<RecipeInfo> findRecipeById(String id)async {
    final response = await get('${ApiKey.recipeInfo}$id/information?includeNutrition=true');
    return RecipeInfo.fromJson(response);
  }

  @override
  Future<Recipe> fetchFavouriteRecipe() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   String? encodedRecipes= sharedPreferences.getString('favourites');
   logger.d(encodedRecipes);
   List recipes = jsonDecode(encodedRecipes!);
   List<Results> recipeList = recipes.map((e) => Results.fromJson(e)).toList();
   Recipe recipe = Recipe();
   recipe.results = recipeList;
   return recipe;
  }

  @override
  Future<void> saveFavouriteRecipe(Results recipe)async {
    List<Results> recipeStart = [recipe];
    logger.d(recipeStart);
    String encodedRecipe = jsonEncode(recipeStart);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? encodedRecipes= sharedPreferences.getString('favourites');
    if(encodedRecipes != null && encodedRecipes.isNotEmpty){
      String? encodedRecipes= sharedPreferences.getString('favourites');
      List recipes = jsonDecode(encodedRecipes!);
      List<Results> recipeList = recipes.map((e) => Results.fromJson(e)).toList();
      recipeStart.addAll(recipeList);
      String encoded = jsonEncode(recipeStart);
      sharedPreferences.setString('favourites', encoded);
      Utilities.showToast('Recipe marked as favourite');

    }else{
      sharedPreferences.setString('favourites', encodedRecipe);
      Utilities.showToast('Recipe marked as favourite');
    }
  }
}