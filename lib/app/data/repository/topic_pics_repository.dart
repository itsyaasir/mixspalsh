import 'package:meta/meta.dart';
import 'package:unspalsh_app/app/data/models/topic_pics_model.dart';
import 'package:unspalsh_app/app/data/provider/api.dart';

class TopicPicsRepository {
  final MyApiClient apiClient;

  TopicPicsRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<List<TopicPicModel>> getTopicsPics(topicId) {
    return apiClient.getTopicPics(topicId);
  }
}
