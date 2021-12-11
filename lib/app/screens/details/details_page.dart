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
                                // Open top rounded ios bottomsheet with info.

                                // Get.to(
                                //     Scaffold(
                                //       appBar: AppBar(
                                //         title: Text("Info"),
                                //       ),
                                //       body: Container(
                                //         child: ListView(
                                //           children: [
                                //             ListTile(
                                //               title: Text("Author"),
                                //               subtitle:
                                //                   Text("${state.user.name}"),
                                //             ),
                                //             ListTile(
                                //               title: Text("Downloads"),
                                //               subtitle:
                                //                   Text("${state.downloads}"),
                                //             ),
                                //             ListTile(
                                //               title: Text("Likes"),
                                //               subtitle: Text("${state.likes}"),
                                //             ),
                                //             ListTile(
                                //               title: Text("Views"),
                                //               subtitle: Text("${state.views}"),
                                //             ),
                                //             ListTile(
                                //               title: Text("Created At"),
                                //               // subtitle: Text(
                                //               //     "${DateTime.fromMillisecondsSinceEpoch(state.createdAt * 1000).toString()}"),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //     transition: Transition.downToUp);
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
