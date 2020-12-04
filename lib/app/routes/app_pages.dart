import 'package:get/get.dart';
import 'package:unspalsh_app/app/bindings/details_bindings.dart';
import 'package:unspalsh_app/app/bindings/home_bindings.dart';
import 'package:unspalsh_app/app/bindings/topics_bindings.dart';
import 'package:unspalsh_app/app/screens/details/details_page.dart';
import 'package:unspalsh_app/app/screens/home/home_page.dart';
import 'package:unspalsh_app/app/screens/widgets/splash_widget.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => HomePage(),
        bindings: [HomeBinding()]),
    GetPage(
        name: Routes.DETAILS,
        page: () => DetailsPage(),
        binding: DetailsBinding()),
    GetPage(name: Routes.SPLASH, page: () => SplashWidget())
  ];
}
