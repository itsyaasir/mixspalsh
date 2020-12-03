// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
// import 'package:unspalsh_app/app/controller/details/details_controller.dart';
// import 'package:unspalsh_app/app/data/provider/api.dart';
// import 'package:unspalsh_app/app/data/repository/photo_details_repository.dart';

// class DetailsBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<DetailsController>(
//       () => DetailsController(
//         repository: PhotoDetailsRepository(
//           apiClient: MyApiClient(
//             httpClient: Dio(),
//           ),
//         ),
//       ),
//       fenix: true,
//     );
//   }
// }
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:unspalsh_app/app/controller/details/details_controller.dart';
import 'package:unspalsh_app/app/data/provider/api.dart';
import 'package:unspalsh_app/app/data/repository/photo_details_repository.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DetailsController>(
      DetailsController(
        repository: PhotoDetailsRepository(
          apiClient: MyApiClient(
            httpClient: Dio(),
          ),
        ),
      ),
    );
  }
}
