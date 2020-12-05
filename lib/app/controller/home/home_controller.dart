// import 'package:get/get.dart';
// import 'package:unspalsh_app/app/data/models/photo_model.dart';
// import 'package:unspalsh_app/app/data/models/topics_model.dart';
// import 'package:unspalsh_app/app/data/provider/api.dart';

// class HomeController extends GetxController {
//   var isLoading = true.obs;
//   final photoModel = List<PhotoModel>().obs;
//   final topicModel = List<TopicModel>().obs;
//   @override
//   void onInit() {
//     fetchPhotos();
//     fetchTopics();
//     super.onInit();
//   }

//   void fetchPhotos() async {
//     try {
//       var photos = await MyApiClient.getPhoto();

//       if (photos != null) {
//         photoModel.assignAll(photos);
//       }
//     } finally {
//       isLoading(false);
//     }
//   }

//   void fetchTopics() async {
//     try {
//       isLoading(true);
//       var topics = await MyApiClient.getTopic();

//       if (topics != null) {
//         topicModel.assignAll(topics);
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
// }
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:unspalsh_app/app/data/models/trending_photo_model.dart';
import 'package:unspalsh_app/app/data/repository/photo_repository.dart';
import 'package:unspalsh_app/app/routes/app_pages.dart';

class HomeController extends GetxController with StateMixin<List<PhotoModel>> {
  final PhotoRepository repository;
  HomeController({@required this.repository}) : assert(repository != null);
  @override
  void onInit() {
    getPhotos();
    super.onInit();
  }

  // TopicID
  final _topicId = "".obs;
  get topicId => this._topicId.value;
  set topicId(value) => this._topicId.value = value;
  // Id of the photo
  final _id = "".obs;
  set id(value) => this._id.value = value;
  get id => this._id.value;

  final _photoModel = List<PhotoModel>().obs;
  List<PhotoModel> get photoList => this._photoModel.toList();
  set photoList(photos) => this._photoModel.assignAll(photos);

  // List<PhotoModel> getPhotos() {
  //   repository.getPhotos().then((data) {
  //     this.photoList = data;
  //     return this.photoList;
  //   });
  // }

  Future<List<PhotoModel>> getPhotos() async {
    var data;
    try {
      data = await repository.getPhotos();
      change(data, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  details({String id}) {
    this.id = id;
    Get.toNamed(Routes.DETAILS);
  }

  topicPics(String topicId) {
    this.topicId = topicId;
    Get.toNamed(Routes.TOPIC);
  }
}
