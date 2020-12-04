import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:unspalsh_app/app/controller/home/home_controller.dart';
import 'package:unspalsh_app/app/screens/widgets/image_widget.dart';
import 'package:unspalsh_app/app/screens/widgets/loading_widget.dart';
import '../widgets/reusable_text_bebas.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 5.0, left: 30, right: 30, bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icon.png",
                        fit: BoxFit.cover,
                        width: 45,
                        height: 40,
                      ),
                      SizedBox(width: 5),
                      TextComponent(
                          title: "MiXplash", fontSize: 30, letterSpacing: 3),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                TextComponent(title: "Explore", fontSize: 20, letterSpacing: 2),
                SizedBox(height: 10),
                Container(
                    height: 150,
                    child: Obx(() => ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.topicModel.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.only(right: 7),
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "${controller.topicModel[index].coverPhoto.urls.small}"),
                                    fit: BoxFit.cover,
                                    colorFilter: new ColorFilter.mode(
                                        Colors.black.withOpacity(0.7),
                                        BlendMode.dstATop),
                                  ),
                                ),
                                child: Center(
                                  child: TextComponent(
                                      title:
                                          "${controller.topicModel[index].title}",
                                      fontSize: 20,
                                      color: Colors.white,
                                      letterSpacing: 10),
                                ),
                              )),
                        ))),

                SizedBox(height: 10),
                TextComponent(
                  title: "Popular",
                  fontSize: 20,
                  letterSpacing: 2,
                ),
                SizedBox(height: 10),
                ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: double.infinity),
                    child: GetX<HomeController>(
                      initState: (state) {
                        Get.find<HomeController>().getPhotos();
                      },
                      builder: (_) {
                        return StaggeredGridView.countBuilder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 4,
                          itemCount: _.photoList.length,
                          itemBuilder: (BuildContext context, int index) =>
                              GestureDetector(
                                  onTap: () {
                                    _.details(id: _.photoList[index].id);
                                  },
                                  child: (_.photoList == null)
                                      ? LoadingWidget()
                                      : ImageWidget(
                                          imageUrl:
                                              "${_.photoList[index].urls.regular}",
                                          hashBlur:
                                              "${_.photoList[index].blurHash}")),
                          staggeredTileBuilder: (int index) =>
                              StaggeredTile.count(2, index.isEven ? 4 : 3),
                          mainAxisSpacing: 7.0,
                          crossAxisSpacing: 7.0,
                        );
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
