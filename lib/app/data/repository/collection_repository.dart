import 'package:meta/meta.dart';
import 'package:unspalsh_app/app/data/models/collection_model.dart';
import 'package:unspalsh_app/app/data/provider/api.dart';

class CollectionRepositroy {
  final MyApiClient apiClient;

  CollectionRepositroy({@required this.apiClient}) : assert(apiClient != null);

  Future<List<CollectionModel>> getCollection() {
    return apiClient.getCollection();
  }
}
