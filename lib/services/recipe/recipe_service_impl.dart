
import 'package:logger/logger.dart';
import 'package:yahaal_test/models/recipe.dart';
import 'package:yahaal_test/services/recipe/recipe_service.dart';
import 'package:yahaal_test/utils/base_api.dart';

class RecipeServiceImpl extends BaseApi implements RecipeService{
  final logger = Logger();

  @override
  Future<Recipe> fetchRecipes() async{
    final response = await get('https://api.spoonacular.com/recipes/complexSearch');
    return Recipe.fromJson(response);
  }

  @override
  Future<Recipe> findRecipeByName(String name) async{
    Map<String,dynamic> query = {'query':name};
    final response = await get('https://api.spoonacular.com/recipes/complexSearch',query: query);
    return Recipe.fromJson(response);
  }
}