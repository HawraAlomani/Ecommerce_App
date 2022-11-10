import 'package:ecommerce_app/view/widgets/auth/auth_text_form_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/theme.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({
    Key? key,
  }) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [lightPurpleClr, midPurpleClr],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/signupbk.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
              ),
              SizedBox(
                width: double.infinity,
                // height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const TextUtils(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            text: 'Create a new account',
                            color: lightPurpleClr),
                        const SizedBox(
                          height: 20,
                        ),
                        AuthTextFormField(
                          controller: nameController,
                          obscureText: false,
                          validator: () {},
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
                          validator: () {},
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
                        AuthTextFormField(
                          controller: passwordController,
                          obscureText: true,
                          validator: () {},
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
                          suffixIcon: const Text(''),
                          hintText: 'Password',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ]),
                ),
              )
            ],
          )),
    );
  }
}
