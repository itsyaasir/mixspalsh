import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:unspalsh_app/app/controller/collections/collection_controller.dart';
import 'package:unspalsh_app/app/controller/collections_details/collection_details_controller.dart';
import 'package:unspalsh_app/app/controller/home/home_controller.dart';
import 'package:unspalsh_app/app/screens/widgets/image_widget.dart';
import 'package:unspalsh_app/app/screens/widgets/loading_widget.dart';
import 'package:unspalsh_app/app/screens/widgets/reusable_text_bebas.dart';

class CollectionDetailPage extends GetView<CollectionDetailController> {
  const CollectionDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final collectionController = Get.find<CollectionController>();
    final index = Get.find<CollectionController>().index;
    final homeController = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 50, right: 7, left: 7, bottom: 10),
              child: Column(
                children: [
                  collectionController.obx(
                    (state) => Column(
                      children: [
                        // back button to go back to collections
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        Center(
                          child: ListTile(
                            title: TextComponent(
                              title: "${state[index].title}",
                              fontSize: 30,
                              color: Colors.black,
                              letterSpacing: 5,
                            ),
                            contentPadding: const EdgeInsets.all(20.0),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextComponent(
                                    title: "Total Photos : ", fontSize: 20),
                                TextComponent(
                                    title: "${state[index].totalPhotos}",
                                    fontSize: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: double.infinity),
                    child: controller.obx(
                        (state) => StaggeredGridView.countBuilder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisCount: 4,
                              itemCount: state.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  GestureDetector(
                                onTap: () {
                                  homeController.details(id: state[index].id);
                                },
                                child: ImageWidget(
                                    imageUrl: "${state[index].urls.regular}",
                                    hashBlur: "${state[index].blurHash}"),
                              ),
                              staggeredTileBuilder: (int index) =>
                                  StaggeredTile.count(2, index.isEven ? 3 : 4),
                              mainAxisSpacing: 5.0,
                              crossAxisSpacing: 5.0,
                            ),
                        onLoading: LoadingWidget()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
