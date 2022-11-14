import 'package:ecommerce_app/logic/bindings/auth_binding.dart';
import 'package:ecommerce_app/view/screens/auth/forgot_password.dart';
import 'package:ecommerce_app/view/screens/main_screen.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/view/screens/welcome_screen.dart';
import 'package:ecommerce_app/view/screens/auth/login_screen.dart';
import 'package:ecommerce_app/view/screens/auth/signup_screen.dart';

class AppRoutes {
  //initialRoute
  static const welcome = Routes.welcomeScreen;

  //getPages

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signUpScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgotPasswordScreen,
        page: () => ForgotPasswordScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.mainScreen,
        page: () => MainScreen(),
        binding: AuthBinding()),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
}
