part of 'recipe_bloc.dart';

abstract class RecipeEvent extends Equatable {
  @override
  List<Object?> get props => [];
  const RecipeEvent();
}

class FetchRecipesEvent extends RecipeEvent{

}

class FindRecipeByNameEvent extends RecipeEvent{
  final String recipeName;

 const FindRecipeByNameEvent(this.recipeName);
}

class FindRecipeByIdEvent extends RecipeEvent{
  final String id;

  const FindRecipeByIdEvent(this.id);
}

class SaveFavouriteRecipeEvent extends RecipeEvent{
  final Results recipe;
  final RecipeInfo recipes;


  const SaveFavouriteRecipeEvent(this.recipe,this.recipes);
}

class FetchFavouriteRecipeEvent extends RecipeEvent{

}