import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:unspalsh_app/app/data/models/topics_model.dart';
import 'package:unspalsh_app/app/data/repository/topics_repository.dart';

class TopicsController extends GetxController {
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

  List<TopicModel> getTopics() {
    repository.getTopics().then((data) {
      this.topicModel = data;
      return this.topicModel;
    });
  }
}
