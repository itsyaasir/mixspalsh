import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unspalsh_app/app/controller/details/details_controller.dart';
import 'package:unspalsh_app/app/screens/widgets/image_widget.dart';

class DetailsPage extends GetView<DetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          GetX<DetailsController>(
            initState: (state) {
              Get.find<DetailsController>().getPhotoDetails();
              print("getPhotoDetails initialized");
            },
            builder: (_) {
              return ImageWidget(
                imageUrl: "${_.photoDetails.urls.regular}",
                hashBlur: "${_.photoDetails.blurHash}",
                height: Get.height,
                width: Get.width,
              );
            },
          ),
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
