import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:unspalsh_app/app/data/models/trending_photo_model.dart';
import 'package:unspalsh_app/app/data/repository/photo_repository.dart';
import 'package:unspalsh_app/app/routes/app_pages.dart';

class HomeController extends GetxController with StateMixin<List<PhotoModel>> {
  int pageNumber = 1;

  final PhotoRepository repository;
  HomeController({@required this.repository}) : assert(repository != null);
  @override
  void onInit() {
    getPhotos(pageNumber);
    super.onInit();
  }

  // Scroll Counter

  // SelectedIndex for bottomNavigationBar
  final _selectedIndex = 0.obs;
  get selectedIndex => this._selectedIndex.value;
  set selectedIndex(value) => this._selectedIndex.value = value;

  // TopicID
  final _topicId = "".obs;
  get topicId => this._topicId.value;
  set topicId(value) => this._topicId.value = value;
  // Id of the photo
  final _id = "".obs;
  set id(value) => this._id.value = value;
  get id => this._id.value;
// Index of the photo
  final _index = 0.obs;
  get index => this._index.value;
  set index(value) => this._index.value = value;

  // PhotoModel
  final _photoModel = List<PhotoModel>().obs;
  List<PhotoModel> get photoList => this._photoModel.toList();
  set photoList(photos) => this._photoModel.assignAll(photos);




  // ignore: missing_return
  Future<List<PhotoModel>> getPhotos(int pageNumber) async {
    var data;
    try {
      data = await repository.getPhotos(pageNumber);
      change(data, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  details({String id}) {
    this.id = id;
    Get.toNamed(Routes.DETAILS);
  }

  topicPics({String topicId, int index}) {
    this.topicId = topicId;
    this.index = index;
    Get.toNamed(Routes.TOPIC);
  }
}
