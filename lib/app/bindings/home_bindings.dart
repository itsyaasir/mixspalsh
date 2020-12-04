import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:unspalsh_app/app/controller/home/home_controller.dart';
import 'package:unspalsh_app/app/data/provider/api.dart';
import 'package:unspalsh_app/app/data/repository/photo_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(
        repository:
            PhotoRepository(apiClient: MyApiClient(httpClient: Dio()))));
  }
}
