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
      body: controller.obx(
          (state) => Stack(
                children: [
                  // Use this for better loading and error showing.
                  ImageWidget(
                    imageUrl: "${state.urls.regular}",
                    hashBlur: "${state.blurHash}",
                    height: Get.height,
                    width: Get.width,
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
                            color: (!controller.isDownloaded.value)
                                ? Colors.white70
                                : Colors.blue,
                            onPressed: () {
                              controller.savePhoto(
                                  "${state.urls.regular}", "${state.id}");
                            },
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(Icons.share_outlined),
                            iconSize: 30,
                            color: Colors.white70,
                            onPressed: () {
                              controller.sharePhoto(
                                  title: "${state.urls.full}",
                                  subject: "Look at this photo on :");
                            },
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
          onLoading: LoadingWidget()),
    );
  }
}
