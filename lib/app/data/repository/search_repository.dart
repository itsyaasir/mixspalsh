import 'package:flutter/widgets.dart';
import 'package:unspalsh_app/app/data/models/search_model.dart';
import 'package:unspalsh_app/app/data/models/trending_photo_model.dart';
import 'package:unspalsh_app/app/data/provider/api.dart';

class SearchRepository {
  final MyApiClient apiClient;

  SearchRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<SearchModel> search(String query) async {
    return await apiClient.searchPhotos(query);
  }

  // getAll() {
  //   return api.getAll();
  // }

  // getId(id) {
  //   return api.getId(id);
  // }

  // delete(id) {
  //   return api.delete(id);
  // }

  // edit(obj) {
  //   return api.edit(obj);
  // }

  // add(obj) {
  //   return api.add(obj);
  // }
}
