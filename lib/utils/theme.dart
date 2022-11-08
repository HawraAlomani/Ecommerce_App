import 'package:flutter/material.dart';

// My theme colors from design
const Color mainColor = Color.fromRGBO(59, 63, 205, 1);
const Color lightPurpleClr = Color.fromRGBO(218, 227, 251, 1);
const Color greenClr = Color.fromRGBO(143, 177, 69, 1);
const Color midPurpleClr = Color.fromRGBO(147, 164, 246, 1);
const Color normalPurpleClr = Color.fromRGBO(141, 98, 247, 1);
const Color darkPurpleClr = Color.fromRGBO(43, 50, 178, 1);
// Edit later when necessary
const Color darkSettings = Color(0xff6132e4);
const Color accountSettings = Color(0xff73bc65);
const Color logOutSettings = Color(0xff5f95ef);
const Color notiSettings = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);

class ThemesApp {
  static final light = ThemeData(
    primaryColor: mainColor,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: darkPurpleClr,
    backgroundColor: darkPurpleClr,
    brightness: Brightness.dark,
  );
}
