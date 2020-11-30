import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unspalsh_app/controller/topic_controller.dart';

class TopicsPage extends StatelessWidget {
  const TopicsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TopicController controller = Get.put(TopicController());
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
                  Text(
                    "${Get.arguments[1]}",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 25,
                      letterSpacing: 3,
                    ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                height: Get.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage("${Get.arguments[2]}"),
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(
                        Colors.grey.withOpacity(0.4), BlendMode.dstATop),
                  ),
                ),
                child: Center(
                  child: Text(
                    "${Get.arguments[1]}",
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
                      itemCount: controller.topicPicModel.length,
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                        onTap: () {
                          Get.toNamed("/details", arguments: [
                            "${controller.topicPicModel[index].description}",
                            "${controller.topicPicModel[index].urls.regular}",
                            "${controller.topicPicModel[index].user.name}",
                            "${controller.topicPicModel[index].likes}",
                            "${controller.topicPicModel[index].altDescription}",
                            "${controller.topicPicModel[index].user.profileImage.medium}",
                            "${controller.topicPicModel[index].user.location}",
                            "${controller.topicPicModel[index].id}"
                          ]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: new NetworkImage(
                                    "${controller.topicPicModel[index].urls.regular}"),
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
