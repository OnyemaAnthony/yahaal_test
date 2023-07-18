import 'package:flutter/material.dart';
import 'package:yahaal_test/blocs/recipe/recipe_bloc.dart';
import 'package:yahaal_test/models/recipe.dart';
import 'package:yahaal_test/models/recipe_info.dart';
import 'package:yahaal_test/utils/utilities.dart';
import '../widgets/app_bar.dart';
import '../widgets/delayed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
class RecipeDetail extends StatelessWidget {
  RecipeInfo recipeInfo = RecipeInfo();
  late RecipeBloc recipeBloc;
  final Results recipe;
   RecipeDetail(this.recipe, {super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          recipeBloc = BlocProvider.of<RecipeBloc>(context)..add(FindRecipeByIdEvent(recipe.id.toString()));
          return BlocBuilder<RecipeBloc, RecipeState>(
  builder: (context, state) {
    if(state is RecipeInfoLoadedState){
      RecipeInfo recipeInf = state.recipes;
      return _buildRecipesDetails(context,recipeInf);
    }else if(state is RecipeLoadingState){
      return Utilities.showLoader();
    }else if(state is RecipeErrorState) {
      return Utilities.showError(state.errorMessage);
    }else if(state is RecipeSavedState){
      return _buildRecipesDetails(context, state.recipes);
    }
    return Container();
  },
);
        }
      ),
    );

  }
Widget _buildRecipesDetails(BuildContext context,RecipeInfo recipeInf){

  return SafeArea(
    child: CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: MySliverAppBar(expandedHeight: 300, info:recipe,recipeBloc: recipeBloc,recipes: recipeInf),
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DelayedDisplay(
                  delay: const Duration(microseconds: 600),
                  child: Container(
                    padding: const EdgeInsets.all(26.0),
                    child: Text(
                      recipe.title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 26.0, vertical: 10),
                  child: DelayedDisplay(
                    delay: const Duration(microseconds: 700),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-2, -2),
                            blurRadius: 12,
                            color: Color.fromRGBO(0, 0, 0, 0.05),
                          ),
                          BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 5,
                            color: Color.fromRGBO(0, 0, 0, 0.10),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Column(
                              children: [
                                 Text(
                                    "${recipeInf.readyInMinutes} Min",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Text(
                                  "Ready in",
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                          Flexible(
                            flex: 1,
                            child: Column(
                              children: [
                                const Text('200',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Text(
                                  "Servings",
                                  style:
                                  TextStyle(color: Colors.grey.shade600),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                          Flexible(
                            flex: 1,
                            child: Column(
                              children: [
                                const Text('100',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Text("Price/Servings",
                                    style: TextStyle(
                                        color: Colors.grey.shade600))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.all(26.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ingredients",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: recipeInf.nutrition!.ingredients!.map((e) => Text(e.name!,style: TextStyle(fontSize: 20),)).toList(),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Quick summary",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Html(
                        data: recipeInf.summary,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
        )
      ],
    ),
  );

}
}
