import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:unspalsh_app/routes/app_pages.dart';
import 'package:unspalsh_app/screens/home_page.dart';
import 'package:unspalsh_app/theme.dart';

import 'screens/widgets/splash_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    defaultTransition: Transition.fade,
    theme: appThemeData,
    getPages: AppPages.pages,
    home: SplashWidget(),
  ));
}
