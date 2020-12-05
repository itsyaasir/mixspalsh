import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:unspalsh_app/app/controller/collections/collection_controller.dart';
import 'package:unspalsh_app/app/data/provider/api.dart';
import 'package:unspalsh_app/app/data/repository/collection_repository.dart';

class CollectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CollectionController(
        repository:
            CollectionRepositroy(apiClient: MyApiClient(httpClient: Dio()))));
  }
}
