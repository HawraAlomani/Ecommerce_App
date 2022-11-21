import 'package:ecommerce_app/view/screens/category_screen.dart';
import 'package:ecommerce_app/view/screens/favorites_screen.dart';
import 'package:ecommerce_app/view/screens/home_screen.dart';
import 'package:ecommerce_app/view/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ].obs;

  final title = [
    "Kiddo Shop",
    "Categories",
    "Favorites",
    "Settings",
  ].obs;
}
