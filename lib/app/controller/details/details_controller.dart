import 'package:get/get.dart';
import 'package:unspalsh_app/app/data/models/photo_details.dart';
import 'package:unspalsh_app/app/data/provider/api.dart';

class DetailsController extends GetxController {
  final photoDetailsModel = PhotoDetailsModel().obs;

  @override
  void onInit() {
    fetchPhotoDetails();
    super.onInit();
  }

  void fetchPhotoDetails() async {
    try {
      var photoDetails = await MyApiClient.getPhotoDetails();
      if (photoDetails != null) {
        photoDetailsModel.value = photoDetails;
        print(photoDetails);
      }
    } finally {
      print("Reached at fetch photo details");
    }
  }
}
