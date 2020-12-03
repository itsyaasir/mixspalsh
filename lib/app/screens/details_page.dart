import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:unspalsh_app/app/controller/details/details_controller.dart';

import 'widgets/image_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailsController detailsController = Get.put(DetailsController());
    // ImageSaver imageSaver = ImageSaver();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Obx(() {
            return ImageWidget(
              imageUrl:
                  "${detailsController.photoDetailsModel.value.urls.regular}",
              hashBlur: "${detailsController.photoDetailsModel.value.blurHash}",
              height: Get.height,
              width: Get.width,
            );
          }),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.download_outlined),
                    iconSize: 30,
                    color: Colors.white70,
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.share_outlined),
                    iconSize: 30,
                    color: Colors.white70,
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.info_outline_rounded),
                    iconSize: 30,
                    color: Colors.white70,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
