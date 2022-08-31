import 'package:get/get.dart';
import 'package:water/controllers/app_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
  }
}
