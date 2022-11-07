import 'package:get/get.dart';
import 'package:ecommerce_app/view/screens/welcome_screen.dart';

class AppRoutes {
  //initialRoute
  static const welcome = Routes.welcomeScreen;

  //getPages

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
}
