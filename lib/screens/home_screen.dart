import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:yahaal_test/blocs/recipe/recipe_bloc.dart';
import 'package:yahaal_test/models/recipe.dart';
import 'package:yahaal_test/screens/recipe_details.dart';
import 'package:yahaal_test/screens/recipe_search_result.dart';
import 'package:yahaal_test/utils/utilities.dart';
import '../const.dart';
import '../utils/app_colors.dart';
import '../widgets/popular_card.dart';
import '../widgets/primary_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late RecipeBloc recipeBloc ;
  int selectedFoodCard = 0;
  final logger = Logger();
  Recipe recipeState = Recipe();
  @override
  // void initState() {
  //   super.initState();
  //   recipeBloc.add(FetchRecipesEvent());
  // }

  @override
  Widget build(BuildContext context) {
    //recipeBloc.add(FetchRecipesEvent());

    return Builder(
      builder: (BuildContext context) {
        recipeBloc = BlocProvider.of<RecipeBloc>(context)..add(FetchRecipesEvent());
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: false,
            elevation: 0,
            title: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/man.jpeg'),
              ),
            ),
            actions: [
              IconButton(
                onPressed: null,
                icon: SvgPicture.asset('assets/menu.svg'),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          ),
          body: BlocConsumer<RecipeBloc, RecipeState>(
            listener: (context,state){
              if(state is RecipeSearchedState ){
                Utilities.push(context, RecipeSearchResult(recipe: state.recipes,));
              }
            },
  builder: (context, state) {
    if(state is RecipeLoadingState){
      return Utilities.showLoader();
    }else if(state is RecipeLoadedState){
        recipeState = state.recipes;
        return  _buildRecipe(state.recipes);


    }else if(recipeState.results != null){
      return _buildRecipe(recipeState);


    }else if(state is RecipeErrorState){
      return Utilities.showError(state.errorMessage);
    }
    return Container();
  },
),
        );
      }
    );
  }

  Widget _buildRecipe(Recipe recipe){
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: PrimaryText(
                  text: 'Food',
                  size: 22,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: PrimaryText(
                  text: 'Delivery',
                  height: 1.1,
                  size: 42,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  const Icon(
                    Icons.search,
                    color: AppColors.secondary,
                    size: 25,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: TextField(

                        onSubmitted: (input){
                          if(input.isNotEmpty){
                            recipeBloc.add(FindRecipeByNameEvent(input));
                          }else{
                            Utilities.showToast('Please provide a recipe name');
                          }
                        },
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: AppColors.lighterGray)),
                          hintText: 'Search for recipe by name eg Pasta',
                          hintStyle: TextStyle(
                              color: AppColors.lightGray,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: PrimaryText(
                    text: 'Categories',
                    fontWeight: FontWeight.w700,
                    size: 22),
              ),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodCategoryList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                      child: foodCategoryCard(
                          foodCategoryList[index]['imagePath']!,
                          foodCategoryList[index]['name']!,
                          index),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: PrimaryText(
                    text: 'Popular', fontWeight: FontWeight.w700, size: 22),
              ),
              Column(
                children: List.generate(
                  recipe.results!.length,
                      (index) {
                    Results recipeResult = recipe.results![index];

                    return GestureDetector(
                      onTap: (){
                        Utilities.push(context, RecipeDetail(recipeResult));
                      },
                      child: PopularCard(
                        name: recipeResult.title,
                        star: "4.5",
                        weight: '10',

                        imagePath: recipeResult.image,

                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }


  Widget foodCategoryCard(String imagePath, String name, int index) {
    return GestureDetector(
      onTap: () => {
        setState(
              () => {
            logger.d(index),
            selectedFoodCard = index,
          },
        ),
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:
            selectedFoodCard == index ? AppColors.primary : AppColors.white,
            boxShadow: const [
              BoxShadow(
                color: AppColors.lighterGray,
                blurRadius: 15,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(imagePath, width: 40),
            PrimaryText(text: name, fontWeight: FontWeight.w800, size: 16),
            RawMaterialButton(
                onPressed: null,
                fillColor: selectedFoodCard == index
                    ? AppColors.white
                    : AppColors.tertiary,
                shape: const CircleBorder(),
                child: Icon(Icons.chevron_right_rounded,
                    size: 20,
                    color: selectedFoodCard == index
                        ? AppColors.black
                        : AppColors.white))
          ],
        ),
      ),
    );
  }
  // @override
  // void dispose() {
  //   recipeBloc.close();
  //   super.dispose();
  // }
}
