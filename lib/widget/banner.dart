import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../utils/constants.dart';

class BannerToExplore extends StatelessWidget {
  const BannerToExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Carousel Slider with 3 images
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
          ),
          items: [
            'asset/images/7255443.jpg',
            'asset/images/front-view-fried-mushrooms-with-seasonings-dark-grey-table-meal-food-dinner.jpg',
            'asset/images/high-angle-delicious-pakistan-meal-assortment-basket.jpg',

          ].map((imagePath) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),

        const SizedBox(height: 20),

        // Existing Banner Section with Text and Button
        // Container(
        //   width: double.infinity,
        //   height: 170,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(15),
        //     color: kBannerColor,
        //   ),
        //   child: Stack(
        //     children: [
        //       Positioned(
        //         top: 32,
        //         left: 20,
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             const Text(
        //               "Cook the best\nrecipes at home",
        //               style: TextStyle(
        //                 height: 1.1,
        //                 fontSize: 22,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.white,
        //               ),
        //             ),
        //             const SizedBox(height: 10),
        //             ElevatedButton(
        //               style: ElevatedButton.styleFrom(
        //                 padding: const EdgeInsets.symmetric(
        //                   horizontal: 33,
        //                 ),
        //                 backgroundColor: Colors.white,
        //                 elevation: 0,
        //               ),
        //               onPressed: () {},
        //               child: const Text(
        //                 "Explore",
        //                 style: TextStyle(
        //                   fontSize: 15,
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.black,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Positioned(
        //         top: 0,
        //         bottom: 0,
        //         right: -20,
        //         child: Image.asset(
        //           "asset/images/pngimg.com - chef_PNG190.png",
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
