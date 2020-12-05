import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unspalsh_app/app/controller/home/home_controller.dart';
import 'package:unspalsh_app/app/controller/topic_pics/topic_pics_controller.dart';
import 'package:unspalsh_app/app/controller/topics/topics_controller.dart';
import 'package:unspalsh_app/app/screens/widgets/image_widget.dart';
import 'package:unspalsh_app/app/screens/widgets/loading_widget.dart';
import 'package:unspalsh_app/app/screens/widgets/reusable_text_bebas.dart';

class TopicPicsPage extends GetView<TopicPicsController> {
  const TopicPicsPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final topicsController = Get.find<TopicsController>();
    final homeController = Get.find<HomeController>();
    final index = Get.find<HomeController>().index;
    return Container(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 10.0,
            ),
            child: topicsController.obx(
              (state) => Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          size: 30,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      SizedBox(width: 100),
                      TextComponent(
                        title: "${state[index].title}",
                        fontSize: 25,
                        letterSpacing: 3,
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: Get.height / 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        // Cover Photo Small
                        image: NetworkImage(
                            "${state[index].coverPhoto.urls.thumb}"),
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            Colors.grey.withOpacity(0.4), BlendMode.dstATop),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        // Title
                        "${state[index].title}",
                        style: GoogleFonts.bebasNeue(
                          color: Colors.white,
                          letterSpacing: 10,
                          fontSize: 20,
                        ),
                      ),
                    ),
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
                                  homeController.details(id: state[index].id);
                                },
                                child: ImageWidget(
                                    imageUrl: "${state[index].urls.small}",
                                    hashBlur: "${state[index].blurHash}")),
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.count(2, index.isEven ? 4 : 3),
                        mainAxisSpacing: 7.0,
                        crossAxisSpacing: 7.0,
                      ),
                      onLoading: LoadingWidget(),
                    ),
                  ),
                ],
              ),
            )),
      ),
    ));
  }
}
