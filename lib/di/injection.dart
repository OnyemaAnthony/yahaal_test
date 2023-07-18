import 'package:get_it/get_it.dart';
import 'package:yahaal_test/blocs/recipe/recipe_bloc.dart';
import 'package:yahaal_test/repository/recipe/recipe_repository.dart';
import 'package:yahaal_test/repository/recipe/recipe_repository_impl.dart';
import 'package:yahaal_test/services/recipe/recipe_service.dart';
import 'package:yahaal_test/services/recipe/recipe_service_impl.dart';
import 'package:yahaal_test/usecase/recipe/find_recipe_by_id_case.dart';
import 'package:yahaal_test/usecase/recipe/find_recipe_by_name_case.dart';
import 'package:yahaal_test/usecase/recipe/get_recipes_case.dart';
import 'package:yahaal_test/usecase/recipe/save_favourite_recipe_case.dart';

import '../usecase/recipe/get_favourite_recipe_case.dart';


final getIt = GetIt.instance;
class Di{
  static Future<void> initialize()async{
    getIt.registerFactory(() => RecipeBloc());

    getIt.registerLazySingleton<RecipeService>(() => RecipeServiceImpl());
     getIt.registerLazySingleton<RecipeRepository>(() => RecipeRepositoryImpl(getIt()));


     getIt.registerLazySingleton(() => GetRecipes(getIt()));
     getIt.registerLazySingleton(() => FindRecipeByNameCase(getIt()));
     getIt.registerLazySingleton(() => FindRecipeByIdCase(getIt()));
     getIt.registerLazySingleton(() => SaveFavouriteRecipeCase(getIt()));
     getIt.registerLazySingleton(() => GetFavouriteRecipeCase(getIt()));

  }
}
