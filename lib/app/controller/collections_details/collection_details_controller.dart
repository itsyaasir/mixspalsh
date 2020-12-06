import 'package:unspalsh_app/app/controller/collections/collection_controller.dart';
import 'package:unspalsh_app/app/data/models/collection_details_model.dart';
import 'package:get/get.dart';
import 'package:unspalsh_app/app/data/repository/collection_detail_repository.dart';

class CollectionDetailController extends GetxController
    with StateMixin<List<CollectionDetailModel>> {
  final CollectionDetailRepository repository;
  CollectionDetailController({this.repository})
      : assert(CollectionDetailRepository != null);
  @override
  void onInit() {
    getCollectionDetail();
    super.onInit();
  }

  // CollectionDetails param
  final _collectionDetailModel = List<CollectionDetailModel>().obs;
  List<CollectionDetailModel> get collectionDetailModel =>
      this._collectionDetailModel.toList();

  set collectionDetailModel(collectionDetail) =>
      this._collectionDetailModel.assignAll(collectionDetail);

  getCollectionDetail() async {
    var data;
    var collectionId = Get.find<CollectionController>().collectionId;
    try {
      data = await repository.getCollectionDetail(collectionId);
      change(data, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
      print(e.toString());
    }
  }
}
