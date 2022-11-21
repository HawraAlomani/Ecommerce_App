import 'package:ecommerce_app/logic/controllers/auth_controller.dart';
import 'package:ecommerce_app/logic/controllers/theme_controller.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'dart:ui' as ui;

import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                height: 90,
                width: 400,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(68, 0, 0, 0),
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Change Theme: ',
                      style: TextStyle(
                          fontSize: 26,
                          color: Get.isDarkMode
                              ? Color.fromARGB(159, 20, 18, 18)
                              : Colors.grey),
                    ),
                    //toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  Get.isDarkMode ? mainColor : Colors.yellow),
                          child: IconButton(
                              onPressed: () {
                                ThemeController().changesTheme();
                              },
                              icon: Icon(
                                Get.isDarkMode
                                    ? Icons.dark_mode
                                    : Icons.light_mode,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Color.fromARGB(255, 239, 122, 49),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          //log out
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                height: 90,
                width: 400,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(68, 0, 0, 0),
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Log Out: ',
                      style: TextStyle(
                          fontSize: 26,
                          color: Get.isDarkMode
                              ? Color.fromARGB(159, 20, 18, 18)
                              : Colors.grey),
                    ),
                    //toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: notiSettings),
                          child:
                              GetBuilder<AuthController>(builder: (controller) {
                            return IconButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                    title: 'Logout from app',
                                    titleStyle: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    middleText:
                                        'Are you sure you want to logout?',
                                    middleTextStyle: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    backgroundColor:
                                        Color.fromARGB(67, 255, 255, 255),
                                    radius: 16,
                                    textCancel: 'No',
                                    cancelTextColor: Colors.white,
                                    textConfirm: 'Yes',
                                    confirmTextColor: Colors.white,
                                    onCancel: () {
                                      Get.back();
                                    },
                                    onConfirm: () {
                                      controller.signOutFromApp();
                                    },
                                    buttonColor: notiSettings,
                                  );
                                },
                                icon: Icon(Icons.logout, color: Colors.white));
                          }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
