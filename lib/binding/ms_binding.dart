import 'package:get/get.dart';
import 'package:ms/controller/home_controller.dart';

class MSBinding implements Bindings {
  @override
void dependencies() {
    Get.put(HomeController());
}
}
