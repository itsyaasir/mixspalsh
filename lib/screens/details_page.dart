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
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height: Get.height / 1.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                      image: NetworkImage("${Get.arguments[1]}"),
                      fit: BoxFit.cover,
                    ))),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    "${Get.arguments[0]}",
                    style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Icon(Icons.place_outlined),
                      SizedBox(
                        width: 5,
                        height: 10,
                      ),
                      Text(
                        "${Get.arguments[6]}",
                        style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        "${Get.arguments[5]}",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("${Get.arguments[2]}",
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.w500))
                  ]),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey[800]),
                        ),
                        onPressed: () {
                          Share.share("${Get.arguments[1]}", subject: "Check this image on #Unsplash");
                        },
                        icon: Icon(Icons.share_outlined),
                        label: Text("SHARE"),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton.icon(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: () async {
                            if (await Permission.storage.request().isGranted) {
                              imageSaver.save(
                                  Get.arguments[1], Get.arguments[7]);
                              print(Get.arguments[1]);
                              Get.snackbar(
                                  "Success", "Image saved successfully");
                            } else {
                              Get.snackbar("Storage Denied",
                                  "Please Give storage Permission");
                            }
                          },
                          icon: Icon(Icons.download_outlined),
                          label: Text("SAVE")),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
