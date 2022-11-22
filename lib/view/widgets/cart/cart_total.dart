import 'package:ecommerce_app/logic/controllers/cart_controller.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  CartTotal({super.key});
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Container(
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                TextUtils(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    text: 'Total',
                    color: Colors.grey),
                Text(
                  "\$ ${controller.total}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: greenClr,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Check Out ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(Icons.shopping_cart)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ); 
    });
  }
}
