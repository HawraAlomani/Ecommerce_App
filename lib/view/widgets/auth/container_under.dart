import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textType;
  final Function() onPressed;
  const ContainerUnder({required this.text,required this.textType, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration:  BoxDecoration(
         
        // color: greenClr,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0), topRight: Radius.circular(0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              text: text,
              color: Colors.white),
              TextButton(onPressed: onPressed, child: TextUtils(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              text: textType,
              underline: TextDecoration.underline,
              color: Colors.white))
              
        ],
      ),
    );
  }
}
