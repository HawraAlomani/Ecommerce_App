import 'package:ecommerce_app/logic/controllers/auth_controller.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:ecommerce_app/utils/my_string.dart';
import 'package:ecommerce_app/view/screens/auth/auth_button.dart';
import 'package:ecommerce_app/view/widgets/auth/auth_text_form_field.dart';
import 'package:ecommerce_app/view/widgets/auth/check_widget.dart';
import 'package:ecommerce_app/view/widgets/auth/container_under.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({
    Key? key,
  }) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text(
        //   'KIDDO SHOP',
        //   style: TextStyle(fontSize: 22, shadows: <Shadow>[
        //     Shadow(
        //       offset: Offset(2.0, 1.0),
        //       blurRadius: 3.0,
        //       color: mainColor,
        //     ),
        //   ]),
        // ),
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
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Get.isDarkMode
                  ? const AssetImage("assets/images/signupbk.png")
                  : const AssetImage("assets/images/signupbkDK.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          TextUtils(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              text: 'Create a new account',
                              color: Get.isDarkMode
                                  ? lightPurpleClr
                                  : Colors.white),
                          const SizedBox(
                            height: 20,
                          ),
                          AuthTextFormField(
                            controller: nameController,
                            obscureText: false,
                            validator: (value) {
                              if (value.toString().length <= 2 ||
                                  !RegExp(validationName).hasMatch(value)) {
                                return 'Enter valid name';
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
                                'assets/images/icons/user.svg',
                                color: lightPurpleClr,
                                height: 20,
                                width: 20,
                              ),
                            ),
                            suffixIcon: const Text(''),
                            hintText: 'User Name',
                          ),
                          const SizedBox(
                            height: 20,
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
                            height: 20,
                          ),
                          GetBuilder<AuthController>(
                            builder: (_) {
                              return AuthTextFormField(
                                controller: passwordController,
                                obscureText:
                                    controller.isVisibility ? false : true,
                                validator: (value) {
                                  if (value.toString().length < 6) {
                                    return 'Password should be longer or equal to 6 characters';
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
                                    'assets/images/icons/lock.svg',
                                    color: lightPurpleClr,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: (() {
                                    controller.visibility();
                                  }),
                                  icon: controller.isVisibility
                                      ? const Icon(
                                          Icons.visibility_off,
                                          color: mainColor,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color: mainColor,
                                        ),
                                ),
                                hintText: 'Password',
                              );
                            },
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          CheckWidget(),
                          const SizedBox(
                            height: 50,
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return AuthButton(
                                onPressed: () {
                                  if (controller.isCheckBox == false) {
                                    Get.snackbar('Check Box',
                                        "Please, Accept terms & conditions",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: midPurpleClr,
                                        colorText: Colors.black);
                                  } else if (formKey.currentState!.validate()) {
                                    String name = nameController.text.trim();
                                    String email = emailController.text.trim();
                                    String password = passwordController.text;

                                    controller.signUpUsingFirebase(
                                        name: name,
                                        email: email,
                                        password: password);
                                    controller.isCheckBox = true;
                                  }
                                },
                                text: 'SIGN UP');
                          })
                        ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 31,
              ),
              ContainerUnder(
                text: 'Already have an Account? ',
                textType: 'Log in',
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
              ),
            ],
          )),
    );
  }
}
