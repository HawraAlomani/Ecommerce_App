import 'package:ecommerce_app/routes/routes.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/view/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheckBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var displayUserName = '';
  var googleSignIn = GoogleSignIn();
  var displayUserPhoto = '';
  var isSignedIn = false;
  final GetStorage authBox = GetStorage();

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        displayUserName = name;
        auth.currentUser!.updateDisplayName(name);
      });
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll('-', ' ').capitalize!;
      String message = '';
      if (error.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: midPurpleClr,
          colorText: Colors.black);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: midPurpleClr,
          colorText: Colors.black);
    }
  }

  void logInUsingFirebase(
      {required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayUserName = auth.currentUser!.displayName!);
      isSignedIn = true;
      authBox.write('auth', isSignedIn);

      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll('-', ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (error.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: midPurpleClr,
          colorText: Colors.black);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: midPurpleClr,
          colorText: Colors.black);
    }
  }

  void googleSignUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName = googleUser!.displayName!;
      displayUserPhoto = googleUser.photoUrl!;
      isSignedIn = true;
      authBox.write('auth', isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: midPurpleClr,
          colorText: Colors.black);
    }
  }

  void facebookSignUpApp() {}
  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll('-', ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: midPurpleClr,
          colorText: Colors.black);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: midPurpleClr,
          colorText: Colors.black);
    }
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      // await FacebookAuth.i.logOut();
      displayUserName = '';
      displayUserPhoto = '';
      isSignedIn = false;
      authBox.remove('auth');
      update();
      Get.offNamed(Routes.welcomeScreen);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: midPurpleClr,
          colorText: Colors.black);
    }
  }
}
