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

class DetailsController extends GetxController
    with StateMixin<PhotoDetailsModel> {
  // For the controller.obx
  final PhotoDetailsRepository repository;
  DetailsController({@required this.repository}) : assert(repository != null);

  @override
  void onInit() {
    getPhotoDetails(); // To call the method
    super.onInit();
  }

  final _photoDetailsModel = PhotoDetailsModel().obs;
  set photoDetails(photoDetails) =>
      this._photoDetailsModel.value = photoDetails;
  PhotoDetailsModel get photoDetails => this._photoDetailsModel.value;

  Future<PhotoDetailsModel> getPhotoDetails() async {
    String id = Get.find<HomeController>().id;
    var data;
    try {
      data = await repository.getPhotoDetails(id);
      change(data,
          status: RxStatus.success()); // For the StateMixin to show data
    } catch (e) {
      change(null,
          status:
              RxStatus.error(e.toString())); // For the StateMixin to show error
    }
  }
}
