import 'package:flutter/material.dart';
import 'package:yahaal_test/blocs/recipe/recipe_bloc.dart';
import 'package:yahaal_test/models/recipe.dart';
import '../widgets/app_bar.dart';
import '../widgets/trey.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeDetail extends StatelessWidget {
  late RecipeBloc recipeBloc;
  final Results recipe;
   RecipeDetail(this.recipe, {super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          recipeBloc = BlocProvider.of<RecipeBloc>(context)..add(FindRecipeByIdEvent(recipe.id.toString()));
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate: MySliverAppBar(expandedHeight: 300, info:recipe,recipeBloc: recipeBloc),
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
                                        const Text(
                                            '45' +
                                                " Min",
                                            style: TextStyle(
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
                        const Padding(
                          padding: EdgeInsets.all(26.0),
                          child: DelayedDisplay(
                            delay: const Duration(microseconds: 700),
                            child: Text(
                              "Ingredients",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(26.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Instructions",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(26.0),
                          child: Text(
                            "Equipments",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(26.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Quick summary",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 20),
                              // Html(
                              //   data: widget.info.summary,
                              // ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 26),
                          child: Text("Similar items",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ]),
                )
              ],
            ),
          );
        }
      ),
    );

    // return Scaffold(
    //   floatingActionButton: ConstrainedBox(
    //     constraints:
    //     BoxConstraints(minWidth: MediaQuery.of(context).size.width - 40),
    //     child: ElevatedButton(
    //       onPressed: () => {},
    //       style: ElevatedButton.styleFrom(
    //           primary: AppColors.primary,
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(10.0)),
    //           padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
    //           textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    //       child: const Row(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           PrimaryText(
    //             text: 'Place an Order',
    //             fontWeight: FontWeight.w600,
    //             size: 18,
    //           ),
    //           Icon(Icons.chevron_right)
    //         ],
    //       ),
    //     ),
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    //   body: ListView(
    //     children: [
    //       customAppBar(context),
    //       Padding(
    //         padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             const PrimaryText(
    //               text: 'Primavera \nPizza',
    //               size: 45,
    //               fontWeight: FontWeight.w600,
    //             ),
    //             const SizedBox(height: 30),
    //             Row(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 SvgPicture.asset(
    //                   'assets/dollar.svg',
    //                   color: AppColors.tertiary,
    //                   width: 15,
    //                 ),
    //                 const PrimaryText(
    //                   text: '5.99',
    //                   size: 48,
    //                   fontWeight: FontWeight.w700,
    //                   color: AppColors.tertiary,
    //                   height: 1,
    //                 ),
    //               ],
    //             ),
    //             const SizedBox(
    //               height: 40,
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 const SizedBox(
    //                   child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         PrimaryText(
    //                           text: 'Size',
    //                           color: AppColors.lightGray,
    //                           size: 16,
    //                           fontWeight: FontWeight.w500,
    //                         ),
    //                         SizedBox(
    //                           height: 8,
    //                         ),
    //                         PrimaryText(
    //                             text: 'Medium 14"',
    //                             fontWeight: FontWeight.w600),
    //                         SizedBox(
    //                           height: 20,
    //                         ),
    //                         PrimaryText(
    //                           text: 'Crust',
    //                           color: AppColors.lightGray,
    //                           size: 16,
    //                           fontWeight: FontWeight.w500,
    //                         ),
    //                         SizedBox(
    //                           height: 8,
    //                         ),
    //                         PrimaryText(
    //                             text: 'Thin Crust',
    //                             fontWeight: FontWeight.w600),
    //                         SizedBox(
    //                           height: 20,
    //                         ),
    //                         PrimaryText(
    //                           text: 'Delivery in',
    //                           color: AppColors.lightGray,
    //                           size: 16,
    //                           fontWeight: FontWeight.w500,
    //                         ),
    //                         SizedBox(
    //                           height: 8,
    //                         ),
    //                         PrimaryText(
    //                             text: '30 min', fontWeight: FontWeight.w600),
    //                       ]),
    //                 ),
    //                 Hero(
    //                   tag: recipe.image!,
    //                   child: Container(
    //                     decoration: BoxDecoration(
    //                       boxShadow: [BoxShadow(color: Colors.grey[400]!, blurRadius: 30),],
    //                       borderRadius: BorderRadius.circular(100),
    //                     ),
    //                     height: 200,
    //                     child:
    //                     Image.asset(recipe.image!, fit: BoxFit.cover),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             const SizedBox(
    //               height: 50,
    //             ),
    //             const PrimaryText(
    //                 text: 'Ingredients', fontWeight: FontWeight.w700, size: 22),
    //             const SizedBox(
    //               height: 15,
    //             ),
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: 100,
    //         child: ListView.builder(
    //           scrollDirection: Axis.horizontal,
    //           itemCount: ingredients.length,
    //           itemBuilder: (context, index) => Padding(
    //             padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
    //             child: ingredientCard(ingredients[index]['imagePath']!),
    //           ),
    //         ),
    //       ),
    //       const SizedBox(height: 100,)
    //     ],
    //   ),
    // );
  }

  // Container ingredientCard(String imagePath) {
  //   return Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  //       margin: const EdgeInsets.only(
  //         right: 20,
  //       ),
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(20),
  //           color: AppColors.white,
  //           boxShadow: [
  //             BoxShadow(blurRadius: 10, color: Colors.grey[300]!),
  //           ]),
  //       child: Image.asset(
  //         imagePath,
  //         width: 90,
  //       ));
  // }

  // Padding customAppBar(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(
  //       horizontal: 20,
  //       vertical: 10,
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         GestureDetector(
  //           onTap: () => Navigator.pop(context),
  //           child: Container(
  //             padding: const EdgeInsets.all(10),
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(15),
  //                 border: Border.all(width: 1, color: Colors.grey[400]!)),
  //             child: const Icon(Icons.chevron_left),
  //           ),
  //         ),
  //         Container(
  //           padding: const EdgeInsets.all(10),
  //           decoration: BoxDecoration(
  //             color: AppColors.primary,
  //             borderRadius: BorderRadius.circular(15),
  //           ),
  //           child: const Icon(Icons.star, color: AppColors.white),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
