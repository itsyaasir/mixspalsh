
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
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
  final isDownloaded = false.obs;
  set photoDetails(photoDetails) =>
      this._photoDetailsModel.value = photoDetails;
  PhotoDetailsModel get photoDetails => this._photoDetailsModel.value;

  // ignore: missing_return
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

  savePhoto(imageUrl, imageName) async {
    // Permission Handling
    await Permission.storage.request();
    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      var response = await Dio()
          .get(imageUrl, options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          isReturnImagePathOfIOS: true,
          quality: 100,
          name: imageName);
      print(result["isSuccess"].toString());
      (result["isSuccess"])
          ? snackbar(
              title: "Image Saved ",
              message: "Image Saved Successfully",
              color: Colors.grey)
          : snackbar(
              title: "Image Not Saved ",
              message: "Image Not saved ",
              color: Colors.red);
      isDownloaded(true);
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      Get.snackbar("Storage permission Denied", "Please accept permission ");
      await Permission.storage.request();
    }
  }

  sharePhoto({String title, String subject}) {
    Share.share(title, subject: subject);
  }

  void snackbar({String title, String message, Color color}) {
    return Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      overlayBlur: 2,
      barBlur: 5,
      backgroundColor: color,
      borderRadius: 8,
      isDismissible: true,
      margin: EdgeInsets.all(8),
    );
  }
}
