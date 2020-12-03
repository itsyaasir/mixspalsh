// import 'package:get/get.dart';
// import 'package:unspalsh_app/app/data/models/photo_details.dart';
// import 'package:unspalsh_app/app/data/provider/api.dart';

// class DetailsController extends GetxController {
//   final photoDetailsModel = PhotoDetailsModel().obs;

//   @override
//   void onInit() {
//     fetchPhotoDetails();
//     super.onInit();
//   }

//   void fetchPhotoDetails() async {
//     try {
//       var photoDetails = await MyApiClient.getPhotoDetails();
//       if (photoDetails != null) {
//         photoDetailsModel.value = photoDetails;
//         print(photoDetails);
//       }
//     } finally {
//       print("Reached at fetch photo details");
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:unspalsh_app/app/controller/home/home_controller.dart';
import 'package:unspalsh_app/app/data/models/photo_details.dart';
import 'package:unspalsh_app/app/data/repository/photo_details_repository.dart';

class DetailsController extends GetxController {
  final PhotoDetailsRepository repository;
  DetailsController({@required this.repository}) : assert(repository != null);

  final _photoDetailsModel = PhotoDetailsModel().obs;
  set photoDetails(photoDetails) {
    this._photoDetailsModel.value = photoDetails;
    this._photoDetailsModel.refresh();
  }

  PhotoDetailsModel get photoDetails => this._photoDetailsModel.value;

  getPhotoDetails() {
    String id = Get.find<HomeController>().id;
    repository.getPhotoDetails(id).then((data) {
      this.photoDetails = data;
      return this.photoDetails;
    });
  }
}
