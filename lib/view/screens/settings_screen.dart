import 'package:ecommerce_app/logic/controllers/auth_controller.dart';
import 'package:ecommerce_app/logic/controllers/settings_controller.dart';
import 'package:ecommerce_app/logic/controllers/theme_controller.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final controller = Get.put(SettingController());
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
      child: Column(
        children: [
          // profile
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                height: 240,
                width: 400,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(68, 0, 0, 0),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'General',
                    style: TextStyle(
                        fontSize: 26,
                        color: Get.isDarkMode
                            ? Color.fromARGB(159, 20, 18, 18)
                            : Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/1144/1144709.png'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                Obx(() =>   TextUtils(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        text: controller
                            .capitalize(authController.displayUserName.value),
                        color: Get.isDarkMode
                            ? Color.fromARGB(159, 20, 18, 18)
                            : Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextUtils(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      text: authController.displayUserEmail.value,
                      color: Get.isDarkMode
                          ? Color.fromARGB(159, 20, 18, 18)
                          : Colors.grey),
                ]),
              ),
            ),
          ),

          // change theme
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
                      'Change Theme ',
                      style: TextStyle(
                          fontSize: 20,
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
          //language
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
                      'Switch Language ',
                      style: TextStyle(
                          fontSize: 20,
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
                              color: Color.fromARGB(255, 221, 108, 22)),
                          child: IconButton(
                              onPressed: () {
                                // ThemeController().changesTheme();
                              },
                              icon: Icon(
                                Icons.language,
                                color: Colors.white,
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
                      'Log Out ',
                      style: TextStyle(
                          fontSize: 20,
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
                                    backgroundColor: Get.isDarkMode
                                        ? Color.fromARGB(255, 100, 106, 194)
                                        : Color.fromARGB(255, 56, 51, 65),
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
