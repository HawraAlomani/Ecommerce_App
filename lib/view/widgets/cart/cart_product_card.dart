import 'package:ecommerce_app/logic/controllers/cart_controller.dart';
import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  final ProductModels productModels;
  final int index;
  final int quantity;

  CartProductCard({required this.productModels, required this.index, required this.quantity,Key? key})
      : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      width: 100,
      decoration: BoxDecoration(
          color:
              Get.isDarkMode ? lightPurpleClr : Color.fromARGB(241, 49, 41, 61),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 120,
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productModels.image))),
          ),
          SizedBox(width: 20),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModels.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  '\$ ${controller.productSubTotal[index].toStringAsFixed(2)}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.removeProductFromCart(productModels);
                      },
                      icon: Icon(
                        Icons.remove_circle,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                      )),
                  Text(
                    '$quantity',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.addProductToCart(productModels);
                      },
                      icon: Icon(Icons.add_circle,
                          color: Get.isDarkMode ? Colors.black : Colors.white))
                ],
              ),
              IconButton(
                  onPressed: () {
                    controller.removeOneProduct(productModels);
                  },
                  icon: Icon(
                    Icons.delete_outline,
                    color: Color.fromARGB(255, 215, 130, 130),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
