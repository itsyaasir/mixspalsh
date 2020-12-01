import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:unspalsh_app/provider/image_saver.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageSaver imageSaver = ImageSaver();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
