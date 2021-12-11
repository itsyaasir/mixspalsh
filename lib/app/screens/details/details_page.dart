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
                  // Close button to go back on top right

                  // Use this for better loading and error showing
                  ImageWidget(
                    imageUrl: "${state.urls.regular}",
                    hashBlur: "${state.blurHash}",
                    height: Get.height,
                    width: Get.width,
                  ),
                  // Circular Container to show icon close
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0, right: 20),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.8),
                            ],
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                    ),
                  ),
// Frosted glass effect

                  Positioned(
                    bottom: 0,
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 20, bottom: 20, top: 20),
                      height: 100,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.8),
                          ],
                        ),
                      ),
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
                              onPressed: () {
                                // Open a bottom sheet to show the all the info of the photo
                                Get.bottomSheet(
                                  Container(
                                    height: Get.height * 0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          // Avatar
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${state.user.profileImage.large}"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            "Photo by ${state.user.name}",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "${state.description ?? "N/A"}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Downloads : ${state.downloads}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Likes : ${state.likes}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Views : ${state.views}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "${state.location.title.toString().split(",")[0] ?? "N/A"}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Updated at : ${state.updatedAt}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
          onLoading: LoadingWidget()),
    );
  }
}
