import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unspalsh_app/app/controller/home/home_controller.dart';
import 'package:unspalsh_app/app/controller/topics/topics_controller.dart';
import 'package:unspalsh_app/app/screens/collection/collection_page.dart';
import 'package:unspalsh_app/app/screens/home/home_widget.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final topicController = Get.find<TopicsController>();
    List<Widget> pages = [
      HomeWidget(topicController: topicController, controller: controller),
      CollectionWidet(),
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.collections_outlined),
                    label: "Collection"),
              ],
              selectedIconTheme: IconThemeData(color: Colors.black),
              elevation: 8,
              selectedItemColor: Colors.black,
              iconSize: 24,
              currentIndex: controller.selectedIndex,
              onTap: (index) => controller.selectedIndex = index,
            )),
        body: SafeArea(
          child: Obx(() => pages.elementAt(controller.selectedIndex)),
        ));
  }
}

//
//
//
