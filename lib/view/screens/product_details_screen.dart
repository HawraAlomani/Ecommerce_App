import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/view/widgets/productDetails/add_cart.dart';
import 'package:ecommerce_app/view/widgets/productDetails/clothes_info.dart';
import 'package:ecommerce_app/view/widgets/productDetails/image_sliders.dart';
import 'package:ecommerce_app/view/widgets/productDetails/size_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;
  const ProductDetailsScreen({required this.productModels, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Product Details',
            style: const TextStyle(fontSize: 22, shadows: <Shadow>[
              Shadow(
                offset: Offset(2.0, 1.0),
                blurRadius: 3.0,
                color: mainColor,
              ),
            ]),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: Get.isDarkMode
                  ? const LinearGradient(
                      colors: [lightPurpleClr, midPurpleClr],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp)
                  : const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 74, 71, 96),
                        Color.fromARGB(255, 22, 23, 51)
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSliders(
            imageUrl: productModels.image,
          ),
          ClothesInfo(
            title: productModels.title,
            productId: productModels.id,
            rate: productModels.rating.rate,
            description: productModels.description,
          ),
          const SizeList(),
          AddCart(
            price: productModels.price,
            productModels: productModels,
          ),
        ],
      )),
    );
  }
}
