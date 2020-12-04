import 'package:meta/meta.dart';
import 'package:unspalsh_app/app/data/provider/api.dart';

class TopicsRepository {
  final MyApiClient apiClient;

  TopicsRepository({@required this.apiClient}) : assert(apiClient != null);

  getTopics() {
    return apiClient.getTopics();
  }
}
