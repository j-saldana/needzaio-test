import 'package:get/get.dart';

class HomeController extends GetxController {
  int _count = 0;

  int get counter => _count;

  void increment() {
    this._count++;
    update();
  }
}
