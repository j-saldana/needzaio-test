import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:needzaio/model/user_list_model.dart';
import 'package:needzaio/http/request.dart';
import 'package:needzaio/http/url.dart';
import 'package:needzaio/pages/login/login_page.dart';

import '../constants.dart';
import '../sizes.dart';

class HomeController extends GetxController {
  var userListData = List<Data>().obs;

  @override
  void onInit() {
    _apiGetUserList();
    _apiGetUserList2();
    super.onInit();
  }

  void _apiGetUserList() async {
    Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
    Request request = Request(url: urlUserList, body: null);
    request.get().then((value) {
      UserListModel userListModel =
          UserListModel.fromJson(json.decode(value.body));
      this.userListData.value = userListModel.data;
    }).catchError((onError) {
      Get.back();
      error('Error', 'Timeout error on request', true);
    });
  }

  void _apiGetUserList2() async {
    Request request = Request(url: urlUserList2, body: null);
    request.get().then((value) {
      UserListModel userListModel =
          UserListModel.fromJson(json.decode(value.body));
      this.userListData.value += userListModel.data;
      Get.back();
      update();
    }).catchError((onError) {
      Get.back();
      error('Error', 'Timeout error on request', true);
    });
  }

  void error(String title, String mgs, bool iconE) {
    Get.snackbar(
      title,
      mgs,
      icon: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenHeight(kDefaultPadding),
        ),
        child: Icon(
          iconE ? Icons.error : Icons.check_circle,
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

  void deleteItem(int index) {
    userListData.removeAt(index);
    update();
  }

  void goLogin() {
    Get.to(
      LoginPage(),
      transition: Transition.leftToRight,
      duration: Duration(milliseconds: 500),
    );
  }
}
