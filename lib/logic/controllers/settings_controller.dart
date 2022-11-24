import 'package:ecommerce_app/utils/my_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SettingController extends GetxController {

  String capitalize(String profileName) {
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }

  
}
