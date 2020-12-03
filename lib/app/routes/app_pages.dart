import 'package:get/get.dart';
import 'package:unspalsh_app/app/screens/details_page.dart';
import 'package:unspalsh_app/app/screens/home_page.dart';
import 'package:unspalsh_app/app/screens/topics_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => HomePage()),
    GetPage(name: Routes.TOPIC, page: () => TopicsPage()),
    GetPage(name: Routes.DETAILS, page: () => DetailsPage()),
  ];
}
