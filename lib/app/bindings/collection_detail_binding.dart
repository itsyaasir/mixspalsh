import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:unspalsh_app/app/controller/collections/collection_controller.dart';
import 'package:unspalsh_app/app/controller/collections_details/collection_details_controller.dart';
import 'package:unspalsh_app/app/data/provider/api.dart';
import 'package:unspalsh_app/app/data/repository/collection_detail_repository.dart';

class CollectionDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CollectionDetailController>(() => CollectionDetailController(
        repository: CollectionDetailRepository(
            apiClient: MyApiClient(httpClient: Dio()))));
  }
}
