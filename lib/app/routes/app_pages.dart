import 'package:get/get.dart';
import 'package:unspalsh_app/app/bindings/collection_detail_binding.dart';
import 'package:unspalsh_app/app/bindings/details_bindings.dart';
import 'package:unspalsh_app/app/bindings/topic_pics_bindings.dart';
import 'package:unspalsh_app/app/screens/collections_details/collection_details_page.dart';
import 'package:unspalsh_app/app/screens/details/details_page.dart';
import 'package:unspalsh_app/app/screens/home/home_page.dart';
import 'package:unspalsh_app/app/screens/topic_pics/topic_pics_page.dart';
import 'package:unspalsh_app/app/screens/widgets/splash_widget.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => HomePage(),
    ),
    GetPage(
        name: Routes.DETAILS,
        page: () => DetailsPage(),
        binding: DetailsBinding()),
    GetPage(name: Routes.SPLASH, page: () => SplashWidget()),
    GetPage(
      name: Routes.TOPIC,
      page: () => TopicPicsPage(),
      binding: TopicPicsBinding(),
    ),
    GetPage(
        name: Routes.COLLECTIONDETAIL,
        page: () => CollectionDetailPage(),
        binding: CollectionDetailBinding())
  ];
}
