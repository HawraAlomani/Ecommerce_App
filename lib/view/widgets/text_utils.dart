import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration underline;
  const TextUtils({
    required this.fontSize,
    required this.fontWeight,
    required this.text,
    required this.color,
    this.underline = TextDecoration
        .none, // defualt value is none, to make it optional styling
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: underline,
          ),
        ));
  }
}
