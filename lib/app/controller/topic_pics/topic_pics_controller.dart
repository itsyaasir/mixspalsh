import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:unspalsh_app/app/controller/home/home_controller.dart';
import 'package:unspalsh_app/app/data/models/topic_pics_model.dart';
import 'package:unspalsh_app/app/data/repository/topic_pics_repository.dart';

class TopicPicsController extends GetxController
    with StateMixin<List<TopicPicModel>> {
  final TopicPicsRepository repository;
  TopicPicsController({@required this.repository}) : assert(repository != null);
  @override
  void onInit() {
    getTopicPics();
    super.onInit();
  }

  final _topicPicsModel = List<TopicPicModel>().obs;
  get topicPicsModel => this._topicPicsModel.toList();
  set topicPicsModel(topicPics) => this._topicPicsModel.assignAll(topicPics);
// ignore: missing_return
  Future<List<TopicPicModel>> getTopicPics() async {
    var data;
    try {
      String topicId = Get.find<HomeController>().topicId;
      data = await repository.getTopicsPics(topicId);
      change(data, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
