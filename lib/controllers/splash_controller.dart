import 'package:get/get.dart';
import 'package:needzaio/pages/home_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(
      Duration(seconds: 2),
      () {
        Get.to(
          HomePage(),
          transition: Transition.zoom,
        );
      },
    );
  }
}
