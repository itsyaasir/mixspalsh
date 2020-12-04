import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ImageSaver imageSaver = ImageSaver();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.network(
            "${Get.arguments[1]}",
            fit: BoxFit.cover,
            height: Get.height,
            width: Get.width,
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.download_outlined),
                    iconSize: 30,
                    color: Colors.white70,
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.share_outlined),
                    iconSize: 30,
                    color: Colors.white70,
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.info_outline_rounded),
                    iconSize: 30,
                    color: Colors.white70,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
