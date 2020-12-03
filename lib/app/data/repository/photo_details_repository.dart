import 'package:meta/meta.dart';
import 'package:unspalsh_app/app/data/provider/api.dart';

class PhotoDetailsRepository {
  final MyApiClient apiClient;

  PhotoDetailsRepository({@required this.apiClient})
      : assert(apiClient != null);

  getPhotoDetails(String id) {
    return apiClient.getPhotoDetails(id);
  }
}
