import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:unspalsh_app/app/controller/home/home_controller.dart';
import 'package:unspalsh_app/app/controller/topics/topics_controller.dart';
import 'package:unspalsh_app/app/data/provider/api.dart';
import 'package:unspalsh_app/app/data/repository/photo_repository.dart';
import 'package:unspalsh_app/app/data/repository/topics_repository.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(
        repository:
            PhotoRepository(apiClient: MyApiClient(httpClient: Dio()))));
    Get.lazyPut<TopicsController>(() => TopicsController(
        repository:
            TopicsRepository(apiClient: MyApiClient(httpClient: Dio()))));

    // Another Implementation
    // Get.lazyPut(
    //   () => PhotoRepository(
    //     apiClient: MyApiClient(
    //       httpClient: Dio(),
    //     ),
    //   ),
    // );
    // Get.lazyPut(
    //   () => HomeController(
    //     repository: Get.find<PhotoRepository>(),
    //   ),
    // );
  }
}
