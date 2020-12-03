import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:unspalsh_app/app/routes/app_pages.dart';

import '../home/home_page.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      backgroundColor: Colors.white,
      image: Image.asset("assets/splash.jpg"),
      photoSize: 200,
      seconds: 5,
      navigateAfterSeconds: HomePage(),
      loaderColor: Colors.black,
    );
  }
}
