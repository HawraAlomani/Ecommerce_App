import 'package:ecommerce_app/logic/controllers/auth_controller.dart';
import 'package:ecommerce_app/utils/my_string.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/view/screens/auth/auth_button.dart';
import 'package:ecommerce_app/view/widgets/auth/auth_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forgot Password',
          style: TextStyle(fontSize: 22, shadows: <Shadow>[
            Shadow(
              offset: Offset(2.0, 1.0),
              blurRadius: 3.0,
              color: mainColor,
            ),
          ]),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Get.isDarkMode
                ? const LinearGradient(
                    colors: [lightPurpleClr, midPurpleClr],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp)
                : const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 74, 71, 96),
                      Color.fromARGB(255, 22, 23, 51)
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Get.isDarkMode
                ? const AssetImage("assets/images/lightGeneralBK.png")
                : const AssetImage("assets/images/darkGeneralBK.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    'If you want to recover your account, then please provide your email ID below..',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/forgot_password.png',
                    width: 350,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AuthTextFormField(
                    controller: emailController,
                    obscureText: false,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return "Invalid Email";
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/images/icons/envelope.svg',
                        color: lightPurpleClr,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    suffixIcon: const Text(''),
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          String email = emailController.text.trim();
                          controller.resetPassword(email);
                        }
                      },
                      text: "SEND",
                    );
                  }),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 2.6,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
