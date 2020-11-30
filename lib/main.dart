import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unspalsh_app/routes/app_pages.dart';
import 'package:unspalsh_app/screens/home_page.dart';
import 'package:unspalsh_app/theme.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    theme: appThemeData,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    home: HomePage(),
  ));
}
