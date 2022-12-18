import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();

  Future<bool> initialize() async {
    return true;
  }
}