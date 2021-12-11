import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:unspalsh_app/app/controller/search/search_controller.dart';
import 'package:unspalsh_app/app/screens/widgets/image_widget.dart';
import 'package:unspalsh_app/app/screens/widgets/loading_widget.dart';

class SearchPage extends GetView<SearchPageController> {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Return search page
    return Scaffold(
      // Retrun rounded container with search bar and search button
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                // Outline border with rounded corner and grey color and black when focused
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),

                onFieldSubmitted: (value) {
                  controller.search(value);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: controller.obx(
                (state) => state == null
                    ? Center(
                        child: Text(
                          'No results',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: StaggeredGridView.countBuilder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 4,
                          itemCount: state.results.length,
                          itemBuilder: (BuildContext context, int index) =>
                              ImageWidget(
                                  imageUrl:
                                      "${state.results[index].urls.regular}",
                                  hashBlur: "${state.results[index].blurHash}"),
                          staggeredTileBuilder: (int index) =>
                              StaggeredTile.count(2, index.isEven ? 4 : 3),
                          mainAxisSpacing: 7.0,
                          crossAxisSpacing: 7.0,
                        ),
                      ),
                onLoading: LoadingWidget(),
                onEmpty: Center(
                  child: Text('No result found'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
