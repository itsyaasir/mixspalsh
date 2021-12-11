import 'package:get/get.dart';
import 'package:unspalsh_app/app/data/models/photo_details.dart';
import 'package:unspalsh_app/app/data/models/search_model.dart';
import 'package:unspalsh_app/app/data/repository/search_repository.dart';

class SearchPageController extends GetxController with StateMixin<SearchModel> {
  final SearchRepository repository;
  SearchPageController({this.repository});

  final _searchPhotos = SearchModel().obs;
  // final isDownloaded = false.obs;
  set searchPhotos(searchPhotos) => this._searchPhotos.value = searchPhotos;
  SearchModel get searchPhotos => this._searchPhotos.value;

  search(String value) async {
    var data;
    try {
      data = await repository.search(value);
      change(data,
          status: RxStatus.success()); // For the StateMixin to show data
    } catch (e) {
      change(null,
          status:
              RxStatus.error(e.toString())); // For the StateMixin to show error
    }
  }
}
