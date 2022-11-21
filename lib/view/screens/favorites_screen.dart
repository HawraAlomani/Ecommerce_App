import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:get/get.dart';

import '../../logic/controllers/product controller.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Obx(() {
          if (controller.favouriteList.isEmpty) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 450,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/ADD_FAV.png'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Please, add your favorite products.',
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.black38 : Colors.white,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ));
          } else {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return buildFavItems(
                    image: controller.favouriteList[index].image,
                    price: controller.favouriteList[index].price,
                    title: controller.favouriteList[index].title,
                    productid: controller.favouriteList[index].id,
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey,
                    thickness: 1,
                  );
                },
                itemCount: controller.favouriteList.length);
          }
        }));
  }

  Widget buildFavItems({
    required String image,
    required double price,
    required String title,
    required  int productid,
  }) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  controller.manageFavorites(productid);
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
