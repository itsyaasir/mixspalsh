import 'package:meta/meta.dart';
import 'package:unspalsh_app/app/data/models/collection_details_model.dart';
import 'package:unspalsh_app/app/data/provider/api.dart';

class CollectionDetailRepository {
  final MyApiClient apiClient;

  CollectionDetailRepository({@required this.apiClient})
      : assert(apiClient != null);

  Future<List<CollectionDetailModel>> getCollectionDetail(collectionId) {
    return apiClient.getCollectionDetail(collectionId);
  }
}
