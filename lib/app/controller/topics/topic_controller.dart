import 'package:get/get.dart';
import 'package:unspalsh_app/app/data/models/topic_pic_model.dart';
import 'package:unspalsh_app/app/data/provider/api.dart';

class TopicController extends GetxController {
  var isLoading = true.obs;
  final topicPicModel = List<TopicPicModel>().obs;

  @override
  void onInit() {
    fetchTopicPhotos();
    super.onInit();
  }

  void fetchTopicPhotos() async {
    try {
      isLoading(true);
      var topicPhotos = await MyApiClient.getTopicPic();

      if (topicPhotos != null) {
        topicPicModel.assignAll(topicPhotos);
      }
    } finally {
      isLoading(false);
    }
  }
}
