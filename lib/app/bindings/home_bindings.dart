import 'package:get/get.dart';
import 'package:unspalsh_app/app/controller/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
