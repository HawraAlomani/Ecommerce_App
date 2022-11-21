import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
      child: Column(children: [Text('category screen')]),
    );
  }
}
