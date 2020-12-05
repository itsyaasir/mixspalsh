import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unspalsh_app/app/controller/collections/collection_controller.dart';
import 'package:unspalsh_app/app/screens/widgets/image_widget.dart';
import 'package:unspalsh_app/app/screens/widgets/loading_widget.dart';
import 'package:unspalsh_app/app/screens/widgets/reusable_text_bebas.dart';

class CollectionWidet extends GetView<CollectionController> {
  const CollectionWidet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextComponent(
            title: "Collections",
            fontSize: 40,
            letterSpacing: 4,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Explore the world through beautiful collections on Unsplash",
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: double.infinity),
            child: controller.obx(
              (state) => ListView.builder(
                itemCount: state.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ImageWidget(
                            imageUrl: "${state[index].coverPhoto.urls.regular}",
                            hashBlur: "${state[index].coverPhoto.blurHash}",
                            colorBlendMode: BlendMode.dstATop,
                            height: 250,
                            width: double.infinity),
                      ),
                      Positioned.fill(
                        child: Align(
                          child: TextComponent(
                            title: "${state[index].title}",
                            fontSize:
                                (state[index].title.length > 10) ? 20 : 30,
                            color: Colors.white,
                            letterSpacing: 15,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        bottom: 20,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: TextComponent(
                            title: "Curated By ${state[index].user.name}",
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

// GestureDetector(
//                     onTap: () {},
//                     child: Column(
//                       children: [
//                         ImageWidget(
//                             imageUrl:
//                                 "https://images.unsplash.com/photo-1506364180601-180da27fe1b7?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max",
//                             hashBlur: "L12i60xt00D%%MofIURj4.Rj?a%2"),
//                       ],
//                     ),
//                   ),
//                   staggeredTileBuilder: (int index) =>
//                       StaggeredTile.count(2, index.isEven ? 3 : 3),
//                   mainAxisSpacing: 7.0,
//                   crossAxisSpacing: 7.0,
//                 ),
