import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needzaio/constants.dart';
import 'package:needzaio/http/request.dart';
import 'package:needzaio/http/url.dart';
import 'package:needzaio/pages/home/home_page.dart';
import 'package:needzaio/pages/splash/splash_page.dart';
import 'package:needzaio/sizes.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;

  String _name = '';

  String get name => _name;

  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailTextController?.dispose();
    passwordTextController?.dispose();
    super.onClose();
  }

  void clearTexts() {
    emailTextController.clear();
    passwordTextController.clear();
  }

  void apiLogin() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    Request request = Request(url: urlLogin, body: {
      'email': emailTextController.text.toLowerCase(),
      'password': passwordTextController.text
    });
    request.post().then((response) {
      if (response.statusCode == 200) {
        this._name = emailTextController.text.substring(0, 1).toUpperCase() +
            emailTextController.text.substring(1);
        update();
        goHome();
      } else {
        Get.back();
        error('Login error', 'User incorrect');
      }
    }).catchError((onError) {
      Get.back();
      error('Error', 'Timeout error on request');
    });
  }

  void error(String title, String mgs) {
    Get.snackbar(
      title,
      mgs,
      icon: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenHeight(kDefaultPadding),
        ),
        child: Icon(
          Icons.error,
          size: getProportionateScreenHeight(40),
          color: Colors.white,
        ),
      ),
      backgroundColor: kTextColor,
      margin: EdgeInsets.only(
        bottom: getProportionateScreenHeight(kDefaultPadding),
      ),
      titleText: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenHeight(kDefaultPadding + 10),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      messageText: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenHeight(kDefaultPadding + 10),
        ),
        child: Text(
          mgs,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      maxWidth: Get.width * 0.9,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  void goSplash() {
    clearTexts();
    Get.to(
      SplashPage(),
      transition: Transition.leftToRight,
      duration: Duration(milliseconds: 500),
    );
  }

  void goHome() {
    clearTexts();
    Get.to(
      HomePage(),
      transition: Transition.rightToLeft,
      duration: Duration(milliseconds: 500),
    );
  }
}
