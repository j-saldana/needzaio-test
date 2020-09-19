import 'package:get/get.dart';
import 'package:needzaio/pages/home/home_page.dart';
import 'package:needzaio/pages/splash/splash_page.dart';

class LoginController extends GetxController {
  void goSplash() {
    Get.to(
      SplashPage(),
      transition: Transition.leftToRight,
      duration: Duration(milliseconds: 500),
    );
  }

  void goHome() {
    Get.to(
      HomePage(),
      transition: Transition.rightToLeft,
      duration: Duration(milliseconds: 500),
    );
  }
}
