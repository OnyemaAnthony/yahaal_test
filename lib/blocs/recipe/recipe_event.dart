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