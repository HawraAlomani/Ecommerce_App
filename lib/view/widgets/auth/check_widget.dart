import 'package:ecommerce_app/logic/controllers/auth_controller.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: lightPurpleClr,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckBox
                  ? Image.asset('assets/images/icons/check.png')
                  : Container(),
            ),
          ),
          const SizedBox(width: 10),
          Row(
            children: const [
              TextUtils(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  text: 'I accept ',
                  color: lightPurpleClr),
              TextUtils(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  text: 'terms & conditions',
                  color: lightPurpleClr,
                  underline: TextDecoration.underline),
            ],
          )
          // AuthButton(),
        ],
      );
    });
  }
}
