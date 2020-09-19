import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needzaio/pages/login/login_page.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants.dart';
import '../sizes.dart';

class SplashController extends GetxController {
  PermissionStatus permissionStatus;

  bool get getStatus => permissionStatus.isGranted;

  @override
  Future<void> onReady() async {
    super.onReady();
    requestPermission();
  }

  void requestPermission() async {
    this.permissionStatus = await Permission.locationWhenInUse.request();
    update();
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
          size: getProportionateScreenHeight(50),
          color: kTextColor,
        ),
      ),
      backgroundColor: Colors.white,
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
            color: kTextColor,
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
            color: kTextColor,
          ),
        ),
      ),
      maxWidth: Get.width * 0.9,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  void goLogin() {
    if (permissionStatus.isGranted) {
      Get.to(
        LoginPage(),
        transition: Transition.rightToLeft,
        duration: Duration(milliseconds: 500),
      );
    } else {
      requestPermission();
    }
  }
}
