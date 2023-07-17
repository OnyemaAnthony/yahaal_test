import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../const.dart';
import '../utils/app_colors.dart';
import '../widgets/primary_text.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedFoodCard = 0;

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
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
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Icon(
                      Icons.search,
                      color: AppColors.secondary,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: AppColors.lighterGray)),
                            hintText: 'Search..',
                            hintStyle: TextStyle(
                                color: AppColors.lightGray,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                    SizedBox(width: 20),
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
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                      child: foodCategoryCard(
                          foodCategoryList[index]['imagePath']!,
                          foodCategoryList[index]['name']!,
                          index),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: PrimaryText(
                      text: 'Popular', fontWeight: FontWeight.w700, size: 22),
                ),
                Column(
                  children: List.generate(
                    popularFoodList.length,
                        (index) => popularFoodCard(
                        popularFoodList[index]['imagePath']!,
                        popularFoodList[index]['name']!,
                        popularFoodList[index]['weight']!,
                        popularFoodList[index]['star']!),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget popularFoodCard(
      String imagePath, String name, String weight, String star) {
    return GestureDetector(
      onTap: () => {
        // Navigator.push(context,push
        //     MaterialPageRoute(builder: (context) => FoodDetail(imagePath)))
      },
      child: Container(
        margin: const EdgeInsets.only(right: 25, left: 20, top: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(blurRadius: 10, color: AppColors.lighterGray)],
          color: AppColors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.primary,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          PrimaryText(
                            text: 'top of the week',
                            size: 16,
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.2,
                        child: PrimaryText(
                            text: name, size: 22, fontWeight: FontWeight.w700),
                      ),
                      PrimaryText(
                          text: weight, size: 18, color: AppColors.lightGray),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                      decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Icon(Icons.add, size: 20),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      child: Row(
                        children: [
                          const Icon(Icons.star, size: 12),
                          const SizedBox(width: 5),
                          PrimaryText(
                            text: star,
                            size: 18,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              transform: Matrix4.translationValues(30.0, 25.0, 0.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(color: Colors.grey[400]!, blurRadius: 20)
                  ]),
              child: Hero(
                tag: imagePath,

                child: ClipRRect(
                  //borderRadius: BorderRadius.circular(50),
                  child: Image.asset(imagePath, width: 150),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodCategoryCard(String imagePath, String name, int index) {
    return GestureDetector(
      onTap: () => {
        setState(
              () => {
            print(index),
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
}
