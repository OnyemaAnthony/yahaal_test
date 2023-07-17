import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yahaal_test/usecase/recipe/find_recipe_by_name_case.dart';
import 'package:yahaal_test/usecase/recipe/get_recipes_case.dart';

import '../../models/recipe.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeInitial()) {
    on<FetchRecipesEvent>(_mapFetchRecipesEventToState);
    on<FindRecipeByNameEvent>(_mapFindRecipeByNameEventEventToState);
  }

  FutureOr<void> _mapFetchRecipesEventToState(FetchRecipesEvent event, Emitter<RecipeState> emit) async{
    emit(RecipeLoadingState());
    final response = await GetRecipes.it.call();
    response.fold((error) {
      //handle error
      emit(RecipeErrorState(error.message));
    }, (recipe) {
      emit(RecipeLoadedState(recipe));
    });

  }

  FutureOr<void> _mapFindRecipeByNameEventEventToState(FindRecipeByNameEvent event, Emitter<RecipeState> emit) async{
    emit(RecipeLoadingState());
    final response = await FindRecipeByNameCase.it.call(event.recipeName);
    response.fold((error) {
      //handle error
      emit(RecipeErrorState(error.message));
    }, (recipe) {
      emit(RecipeSearchedState(recipe));
    });

  }
}
