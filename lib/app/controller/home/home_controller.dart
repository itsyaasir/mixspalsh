import 'package:get/get.dart';
import 'package:unspalsh_app/app/data/models/photo_model.dart';
import 'package:unspalsh_app/app/data/models/topics_model.dart';
import 'package:unspalsh_app/app/data/provider/api.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  final photoModel = List<PhotoModel>().obs;
  final topicModel = List<TopicModel>().obs;
  @override
  void onInit() {
    fetchPhotos();
    fetchTopics();
    super.onInit();
  }

  void fetchPhotos() async {
    try {
      isLoading(true);
      var photos = await MyApiClient.getPhoto();

      if (photos != null) {
        photoModel.assignAll(photos);
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchTopics() async {
    try {
      isLoading(true);
      var topics = await MyApiClient.getTopic();

      if (topics != null) {
        topicModel.assignAll(topics);
      }
    } finally {
      isLoading(false);
    }
  }
}
