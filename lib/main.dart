import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unspalsh_app/app/bindings/home_bindings.dart';
import 'package:unspalsh_app/theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/splash",
    defaultTransition: Transition.fade,
    theme: appThemeData,
    getPages: AppPages.pages,
    // initialBinding:HomeBinding(),
  ));
}
