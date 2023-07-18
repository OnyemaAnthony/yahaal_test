import 'package:flutter/material.dart';
import 'package:yahaal_test/blocs/recipe/recipe_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/recipe.dart';
import '../widgets/popular_card.dart';

class FavouriteRecipeScreen extends StatefulWidget {
  FavouriteRecipeScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteRecipeScreen> createState() => _FavouriteRecipeScreenState();
}

class _FavouriteRecipeScreenState extends State<FavouriteRecipeScreen> {
  late RecipeBloc recipeBloc;

  @override
  Widget build(BuildContext context) {
  return  Scaffold(
    appBar: AppBar(
      title: const Text("Your Favourite recipes"),
    ),
    body: Builder(
      builder: (BuildContext context) {
        recipeBloc = BlocProvider.of<RecipeBloc>(context)..add(FetchFavouriteRecipeEvent());
        return BlocBuilder<RecipeBloc, RecipeState>(
          builder: (context, state) {
            if(state is RecipeLoadedState){
              return ListView.builder(
                itemCount: state.recipes.results!.length,
                itemBuilder: (context, index) {
                  Results recipe = state.recipes.results![index];

                  return PopularCard(
                    isFavourite: true,
                    name: recipe.title,
                    star: "4.5",
                    weight: '10',

                    imagePath: recipe.image,
                  );
                },
              );

            }else if(state is RecipeErrorState){
              return Center(child: Text(state.errorMessage),);
            }
            return Container();
          },
        );
      }
    ),
  );

  }
}
