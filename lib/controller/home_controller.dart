import 'package:get/get.dart';
import 'package:unspalsh_app/models/photo_model.dart';
import 'package:unspalsh_app/models/topics_model.dart';
import 'package:unspalsh_app/provider/api.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  final photoModel = List<PhotoModel>().obs;
  final topicModel = List<TopicModel>().obs;
  // set photoModel(value) => this._photoModel.assignAll(value);
  // get photoModel => this._photoModel.value;
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
