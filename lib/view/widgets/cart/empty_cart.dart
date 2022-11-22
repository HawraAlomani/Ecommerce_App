import 'package:ecommerce_app/routes/routes.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.shopping_cart, size: 200, color: lightPurpleClr),
          const SizedBox(height: 40),
          RichText(
              text: const TextSpan(children: [
            TextSpan(
                text: 'Your Cart is ',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'Empty',
                style: TextStyle(
                    color: Color.fromARGB(255, 215, 130, 130),
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ])),
          const SizedBox(
            height: 10,
          ),
          const Text('add items to get started',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 100,),
          SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenClr,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  )
                ),
                  onPressed: () {
                    Get.toNamed(Routes.mainScreen);
                  },
                  child: const Text('Go to Home', style: TextStyle(fontSize: 20),)))
        ],
      ),
    );
  }
}
