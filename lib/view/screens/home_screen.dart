import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/view/widgets/home/card_items.dart';
import 'package:ecommerce_app/view/widgets/home/search_text_form.dart';
import 'package:ecommerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
                gradient: Get.isDarkMode
                    ? const LinearGradient(
                        colors: [mainColor, midPurpleClr],
                        begin: FractionalOffset(0.0, 1.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp)
                    : const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 74, 71, 96),
                          Color.fromARGB(255, 26, 27, 55)
                        ],
                        begin: FractionalOffset(0.0, 1.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    TextUtils(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      text: "Find Your",
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextUtils(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      text: "INSPIRATION",
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SearchFormText(),

                  ]),
            ),
          ),
        ),
        const SizedBox( height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Align(alignment: Alignment.topLeft, child: TextUtils(fontSize: 20, fontWeight: FontWeight.w500, text: 'Categories', color: Get.isDarkMode? Colors.black: Colors.white)),
        ),
        SizedBox(height: 30,),
        CardItems(),
      ]),
    );
  }
}
