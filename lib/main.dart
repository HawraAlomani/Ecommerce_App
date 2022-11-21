import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/logic/controllers/theme_controller.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kiddo Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute: FirebaseAuth.instance.currentUser != null || GetStorage().read<bool>('auth')==true ? AppRoutes.mainScreen: AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
