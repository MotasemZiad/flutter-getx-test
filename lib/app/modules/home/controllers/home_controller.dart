import 'package:get/get.dart';

class HomeController extends GetxController {
  int count = 0;
  void increment() {
    count++;
    update();
  }
}
