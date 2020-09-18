import 'package:get/get.dart';
import 'package:needzaio/pages/login_page.dart';

class HomeController extends GetxController {
  int _count = 0;

  int get counter => _count;

  void increment() {
    this._count++;
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
