import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unspalsh_app/controller/home_controller.dart';
import 'package:unspalsh_app/controller/topic_controller.dart';

import 'widgets/reusable_text_bebas.dart';

class TopicsPage extends StatelessWidget {
  const TopicsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TopicController topicController = Get.put(TopicController());
    HomeController homeController = Get.put(HomeController());
    int index = Get.arguments[0];
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 10.0,
          ),
          child: Column(
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
                    title: "${homeController.topicModel[index].title}",
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
                        "${homeController.topicModel[index].coverPhoto.urls.small}"),
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(
                        Colors.grey.withOpacity(0.4), BlendMode.dstATop),
                  ),
                ),
                child: Center(
                  child: Text(
                    // Title
                    "${homeController.topicModel[index].title}",
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
                child: Obx(() => StaggeredGridView.countBuilder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      itemCount: topicController.topicPicModel.length,
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                        onTap: () {
                          Get.toNamed("/details", arguments: index

                              // "${topicController.topicPicModel[index].description}",
                              // "${topicController.topicPicModel[index].urls.regular}",
                              // "${topicController.topicPicModel[index].user.name}",
                              // "${topicController.topicPicModel[index].likes}",
                              // "${topicController.topicPicModel[index].altDescription}",
                              // "${topicController.topicPicModel[index].user.profileImage.medium}",
                              // "${topicController.topicPicModel[index].user.location}",
                              // "${topicController.topicPicModel[index].id}",
                              // "${topicController.topicPicModel[index].blurHash}"
                              );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: new NetworkImage(
                                    "${topicController.topicPicModel[index].urls.regular}"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      staggeredTileBuilder: (int index) =>
                          StaggeredTile.count(2, index.isEven ? 4 : 3),
                      mainAxisSpacing: 7.0,
                      crossAxisSpacing: 7.0,
                    )),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
