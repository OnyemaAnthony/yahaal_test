part of 'recipe_bloc.dart';

abstract class RecipeState extends Equatable {
  @override
  List<Object> get props => [];
  const RecipeState();
}

class RecipeInitial extends RecipeState {

}

class RecipeLoadingState extends RecipeState{

}

class RecipeLoadedState extends RecipeState{
  final Recipe recipes;

  const RecipeLoadedState(this.recipes);
}

class FavouriteLoadedState extends RecipeState{
  final Recipe recipes;

  const FavouriteLoadedState(this.recipes);
}

class RecipeErrorState extends RecipeState{
  final String errorMessage;

  const RecipeErrorState(this.errorMessage);
}

class RecipeSavedState extends RecipeState{
  final RecipeInfo recipes;

 const RecipeSavedState(this.recipes);


}
class RecipeSearchedState extends RecipeState{
  final Recipe recipes;

  const RecipeSearchedState(this.recipes);
}

class RecipeInfoLoadedState extends RecipeState{
  final RecipeInfo recipes;

  const RecipeInfoLoadedState(this.recipes);
}





