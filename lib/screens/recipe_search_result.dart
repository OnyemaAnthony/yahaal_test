import 'package:flutter/material.dart';

import '../models/recipe.dart';
import '../widgets/popular_card.dart';

class RecipeSearchResult extends StatefulWidget {
  final Recipe? recipe;
   RecipeSearchResult({Key? key,this.recipe}) : super(key: key);

  @override
  State<RecipeSearchResult> createState() => _RecipeSearchResultState();
}

class _RecipeSearchResultState extends State<RecipeSearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your recipe search results"),
      ),
      body: widget.recipe!.results!.isEmpty?const Center(child:Text("There is no result for you query...") ,): ListView.builder(
        itemCount: widget.recipe!.results!.length,
        itemBuilder: (context,index){
          Results recipe = widget.recipe!.results![index];

          return PopularCard(
            name: recipe.title,
            star: "4.5",
            weight: '10',

            imagePath: recipe.image,
          );
        },
      ),
    );
  }
}
