import 'package:ecommerce_app/routes/routes.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background2.png',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(226, 236, 255, 1),
                      Color.fromARGB(164, 201, 200, 225),
                    ],
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 300,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(26),
                              bottomRight: Radius.circular(26)),
                          boxShadow: [
                            BoxShadow(
                              color: lightPurpleClr,
                              blurRadius: 16,
                              offset: Offset(0, 5), // Shadow position
                            ),
                          ],
                        ),
                        child: const TextUtils(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          text: 'Welcome',
                          color: mainColor,
                        ),
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 12,
                              ),
                              backgroundColor: greenClr,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(26))),
                          onPressed: () {
                            Get.offNamed(Routes.loginScreen);
                          },
                          child: const TextUtils(
                            text: 'Get Started',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextUtils(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              text: 'Don\'t have an account?',
                              color: Colors.white),
                          TextButton(
                              onPressed: () {
                                Get.offNamed(Routes.signUpScreen);
                              },
                              child: const TextUtils(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                text: 'Sign Up',
                                color: Colors.white,
                                underline: TextDecoration.underline,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
