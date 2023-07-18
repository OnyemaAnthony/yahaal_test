import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yahaal_test/widgets/primary_text.dart';

import '../utils/app_colors.dart';

class PopularCard extends StatelessWidget {
  String? imagePath,name,weight,star;
  bool? isFavourite;
   PopularCard({Key? key,this.imagePath,this.name,this.star,this.weight,this.isFavourite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Container(
          margin: const EdgeInsets.only(right: 25, left: 20, top: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow:  const [BoxShadow(blurRadius: 10, color: AppColors.lighterGray)],
            color: AppColors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 20),
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
                        const SizedBox(height: 15),
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
                        child: const Icon(Icons.add, size: 20),
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
                transform: Matrix4.translationValues(15.0, 25.0, 0.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(color: Colors.grey[400]!, blurRadius: 20)
                    ]),
                child: Hero(
                  tag: imagePath!,

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: CachedNetworkImage(
                      imageUrl: imagePath!,
                      imageBuilder: (context, imageProvider) => Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(

                              image: imageProvider,
                              fit: BoxFit.cover,
                              //colorFilter:
                             // const ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                          ),
                        ),
                      ),
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ],
          ));



  }
}
