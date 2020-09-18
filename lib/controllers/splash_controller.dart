import 'package:get/get.dart';
import 'package:needzaio/pages/login_page.dart';
import 'package:permission_handler/permission_handler.dart';

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

  void goLogin() {
    Get.to(
      LoginPage(),
      transition: Transition.rightToLeft,
      duration: Duration(milliseconds: 500),
    );
  }
}
