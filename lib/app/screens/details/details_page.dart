import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unspalsh_app/app/controller/details/details_controller.dart';
import 'package:unspalsh_app/app/screens/widgets/image_widget.dart';
import 'package:unspalsh_app/app/screens/widgets/loading_widget.dart';

class DetailsPage extends GetView<DetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          controller.obx(
              // Use this for better loading and error showing.
              (state) => ImageWidget(
                    imageUrl: "${state.urls.regular}",
                    hashBlur: "${state.blurHash}",
                    height: Get.height,
                    width: Get.width,
                  ),
              onLoading: LoadingWidget()),
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
