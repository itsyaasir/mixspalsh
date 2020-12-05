// import 'package:get/get.dart';
// import 'package:meta/meta.dart';
// import 'package:unspalsh_app/app/controller/home/home_controller.dart';
// import 'package:unspalsh_app/app/data/models/topicPicsModel.dart';
// import 'package:unspalsh_app/app/data/models/topic_pic_model.dart';
// import 'package:unspalsh_app/app/data/models/topic_pic_model.dart';
// import 'package:unspalsh_app/app/data/repository/topics_repository.dart';

// class TopicsController extends GetxController with StateMixin<TopicPicsModel> {
//   final TopicsRepository repository;
//   TopicsController({@required this.repository}) : assert(repository != null);
//   @override
//   void onInit() {
//     getTopicPics();
//     super.onInit();
//   }

//   final _topicPicsModel = TopicPicsModel().obs;
//   set topicPicsModel(topicPics) => this._topicPicsModel.value = topicPics;
//   TopicPicsModel get topicPicsModel => this._topicPicsModel.value;

//   Future<TopicPicsModel> getTopicPics() async {
//     String topicId = Get.find<HomeController>().topicId;
//     var data;
//     try {
//       data = await repository.getTopicPics(topicId);
//       change(data,
//           status: RxStatus.success()); // For the StateMixin to show data
//     } catch (e) {
//       change(null,
//           status:
//               RxStatus.error(e.toString())); // For the StateMixin to show error
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:unspalsh_app/app/data/models/topics_model.dart';
import 'package:unspalsh_app/app/data/repository/topics_repository.dart';

class TopicsController extends GetxController
    with StateMixin<List<TopicModel>> {
  final TopicsRepository repository;
  TopicsController({@required this.repository}) : assert(repository != null);
  @override
  void onInit() {
    getTopics();
    super.onInit();
  }

  final _topicModel = List<TopicModel>().obs;
  List<TopicModel> get topicModel => this._topicModel.toList();
  set topicModel(topics) => this._topicModel.assignAll(topics);

  // ignore: missing_return
  Future<List<TopicModel>> getTopics() async {
    var data;
    try {
      data = await repository.getTopics();
      change(data, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
