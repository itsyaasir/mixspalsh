import 'package:meta/meta.dart';
import 'package:unspalsh_app/app/data/models/trending_photo_model.dart';
import 'package:unspalsh_app/app/data/provider/api.dart';

class PhotoRepository {
  final MyApiClient apiClient;

  PhotoRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<List<PhotoModel>> getPhotos() {
    return apiClient.getPhotos();
  }
}
