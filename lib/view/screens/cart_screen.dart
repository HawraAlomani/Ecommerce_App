import 'package:ecommerce_app/logic/controllers/cart_controller.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/view/widgets/cart/cart_product_card.dart';
import 'package:ecommerce_app/view/widgets/cart/cart_total.dart';
import 'package:ecommerce_app/view/widgets/cart/empty_cart.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(75),
              child: AppBar(
                elevation: 0,
                centerTitle: true,
                actions: [
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: IconButton(
                          onPressed: () {
                            controller.clearAllProducts();
                          },
                          icon: Image.asset(
                              'assets/images/icons/empty-cart.png')))
                ],
                title: const Text(
                  'Cart Items',
                  style: TextStyle(fontSize: 22, shadows: <Shadow>[
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
            // body: EmptyCart(),
            body: Obx(() {
              if (controller.productsMap.isEmpty) {
                return const EmptyCart();
              } else {
                return SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 600,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              index: index,
                              productModels:
                                  controller.productsMap.keys.toList()[index],
                              quantity:
                                  controller.productsMap.values.toList()[index],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 20,
                              ),
                          itemCount: controller.productsMap.length),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: CartTotal(),
                    ),
                  ],
                ));
              }
            })));
  }
}
