import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:unspalsh_app/app/controller/topic_pics/topic_pics_controller.dart';
import 'package:unspalsh_app/app/data/provider/api.dart';
import 'package:unspalsh_app/app/data/repository/topic_pics_repository.dart';

class TopicPicsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TopicPicsController(
        repository:
            TopicPicsRepository(apiClient: MyApiClient(httpClient: Dio()))));
  }
}
