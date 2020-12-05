import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:unspalsh_app/app/controller/home/home_controller.dart';
import 'package:unspalsh_app/app/controller/topics/topics_controller.dart';
import 'package:unspalsh_app/app/screens/widgets/image_widget.dart';
import 'package:unspalsh_app/app/screens/widgets/loading_widget.dart';
import 'package:unspalsh_app/app/screens/widgets/reusable_text_bebas.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key key,
    @required this.topicController,
    @required this.controller,
  }) : super(key: key);

  final TopicsController topicController;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final topicController = Get.find<TopicsController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 5.0, left: 30, right: 30, bottom: 5),
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
            child: topicController.obx(
                (state) => ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          controller.topicPics(
                              topicId: state[index].id, index: index);
                        },
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 7),
                              width: 300,
                              height: 200,
                              child: ImageWidget(
                                imageUrl:
                                    "${state[index].coverPhoto.urls.small}",
                                hashBlur: "${state[index].coverPhoto.blurHash}",
                                colorBlendMode: BlendMode.dstATop,
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                child: TextComponent(
                                  title: "${state[index].title}",
                                  fontSize: 20,
                                  color: Colors.white.withOpacity(1),
                                  letterSpacing: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                onLoading: LoadingWidget()),
          ),
          SizedBox(height: 10),
          TextComponent(
            title: "Popular",
            fontSize: 20,
            letterSpacing: 2,
          ),
          SizedBox(height: 10),
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
                          controller.details(id: state[index].id);
                        },
                        child: ImageWidget(
                            imageUrl: "${state[index].urls.regular}",
                            hashBlur: "${state[index].blurHash}"),
                      ),
                      staggeredTileBuilder: (int index) =>
                          StaggeredTile.count(2, index.isEven ? 4 : 3),
                      mainAxisSpacing: 7.0,
                      crossAxisSpacing: 7.0,
                    ),
                onLoading: LoadingWidget()),
          )
        ],
      ),
    );
  }
}
