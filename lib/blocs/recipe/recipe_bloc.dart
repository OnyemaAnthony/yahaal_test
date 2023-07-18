import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:yahaal_test/models/recipe_info.dart';
import 'package:yahaal_test/usecase/recipe/find_recipe_by_id_case.dart';
import 'package:yahaal_test/usecase/recipe/find_recipe_by_name_case.dart';
import 'package:yahaal_test/usecase/recipe/get_favourite_recipe_case.dart';
import 'package:yahaal_test/usecase/recipe/get_recipes_case.dart';
import 'package:yahaal_test/usecase/recipe/save_favourite_recipe_case.dart';

import '../../models/recipe.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final logger = Logger();

  RecipeBloc() : super(RecipeInitial()) {
    on<FetchRecipesEvent>(_mapFetchRecipesEventToState);
    on<FindRecipeByNameEvent>(_mapFindRecipeByNameEventEventToState);
    on<FindRecipeByIdEvent>(_mapFindRecipeByIdEventToState);
    on<SaveFavouriteRecipeEvent>(_mapSaveFavouriteRecipeEventToState);
    on<FetchFavouriteRecipeEvent>(_mapFetchFavouriteRecipeEventToState);
  }

  FutureOr<void> _mapFetchRecipesEventToState(FetchRecipesEvent event, Emitter<RecipeState> emit) async{
    emit(RecipeLoadingState());
    final response = await GetRecipes.it.call();
    response.fold((error) {
      //handle error
      emit(RecipeErrorState(error.error));
    }, (recipe) {
      emit(RecipeLoadedState(recipe));
    });

  }

  FutureOr<void> _mapFindRecipeByNameEventEventToState(FindRecipeByNameEvent event, Emitter<RecipeState> emit) async{
    emit(RecipeLoadingState());
    final response = await FindRecipeByNameCase.it.call(event.recipeName);
    response.fold((error) {
      //handle error
      emit(RecipeErrorState(error.error));
    }, (recipe) {
       emit(RecipeSearchedState(recipe));
    });

  }

  FutureOr<void> _mapFindRecipeByIdEventToState(FindRecipeByIdEvent event, Emitter<RecipeState> emit)async {
    emit(RecipeLoadingState());
    final response = await FindRecipeByIdCase.it.call(event.id);
    response.fold((error) {
      //handle error
      emit(RecipeErrorState(error.error));
    }, (recipeInfo) {
      emit(RecipeInfoLoadedState(recipeInfo));
    });
  }

  FutureOr<void> _mapSaveFavouriteRecipeEventToState(SaveFavouriteRecipeEvent event, Emitter<RecipeState> emit) async{
    emit(RecipeLoadingState());
    final response = await SaveFavouriteRecipeCase.it.call(event.recipe);
    response.fold((error) {
      //handle error
      emit(RecipeErrorState(error.error));
    }, (recipeInfo) {
      emit(RecipeSavedState(event.recipes));
    });

  }

  FutureOr<void> _mapFetchFavouriteRecipeEventToState(FetchFavouriteRecipeEvent event, Emitter<RecipeState> emit)async {
    emit(RecipeLoadingState());
    final response = await GetFavouriteRecipeCase.it.call();
    response.fold((error) {
      //handle error
      emit(RecipeErrorState(error.error));
    }, (recipe) {
      emit(RecipeLoadedState(recipe));
    });
  }
}
