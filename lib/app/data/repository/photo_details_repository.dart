import 'package:meta/meta.dart';
import 'package:unspalsh_app/app/data/models/photo_details.dart';
import 'package:unspalsh_app/app/data/provider/api.dart';

class PhotoDetailsRepository {
  final MyApiClient apiClient;

  PhotoDetailsRepository({@required this.apiClient})
      : assert(apiClient != null);

  Future<PhotoDetailsModel> getPhotoDetails(String id) {
    return apiClient.getPhotoDetails(id);
  }
}
