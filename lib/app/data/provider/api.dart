import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:unspalsh_app/app/data/models/collection_details_model.dart';
import 'package:unspalsh_app/app/data/models/collection_model.dart';
import 'package:unspalsh_app/app/data/models/photo_details.dart';
import 'package:unspalsh_app/app/data/models/topic_pics_model.dart';
import 'package:unspalsh_app/app/data/models/trending_photo_model.dart';
import 'package:unspalsh_app/app/data/models/topics_model.dart';
import 'package:unspalsh_app/app/env/env.dart';

const apiKey = Env.apikey;
const baseUrl = 'https://api.unsplash.com/';

class MyApiClient {
  final Dio httpClient;
  MyApiClient({@required this.httpClient});

  // ignore: missing_return
  Future<List<PhotoModel>> getPhotos() async {
    String PhotoUrl = 'photos/?client_id=$apiKey&per_page=30&page=1';
    try {
      var response = await httpClient.get(baseUrl + PhotoUrl,
          options: Options(responseType: ResponseType.plain));
      if (response.statusCode == 200) {
        response.headers.forEach((name, values) {
          print("$name : $values");
        });
        var jsonString = response.data.toString();
        final photoModel = photoModelFromJson(jsonString);
        return photoModel;
      } else
        print('erro -get');
      return null;
    } catch (error) {
      Future.error(error.toString());
    }
  }

  // ignore: missing_return
  Future<PhotoDetailsModel> getPhotoDetails(id) async {
    String photoDetailURl = "/photos/$id/?client_id=$apiKey";
    try {
      var response = await httpClient.get(baseUrl + photoDetailURl,
          options: Options(responseType: ResponseType.plain));
      if (response.statusCode == 200) {
        var jsonString = response.data.toString();
        final photoDetailsModel = photoDetailsModelFromJson(jsonString);
        return photoDetailsModel;
      } else
        print('erro -get');
      return null;
    } catch (error) {
      print(error);
    }
  }

  // ignore: missing_return
  Future<List<TopicModel>> getTopics() async {
    String topicURl = 'topics/?client_id=$apiKey&per_page=30&page=1';

    try {
      var response = await httpClient.get(baseUrl + topicURl,
          options: Options(responseType: ResponseType.plain));
      if (response.statusCode == 200) {
        var jsonString = response.data.toString();
        final topicModel = topicModelFromJson(jsonString);
        return topicModel;
      } else
        print('erro -get');
      return null;
    } catch (error) {
      print(error);
    }
  }

  // ignore: missing_return
  Future<List<TopicPicModel>> getTopicPics(topicId) async {
    String topicPicUrl =
        'topics/$topicId/photos/?client_id=$apiKey&per_page=100';
    try {
      var response = await httpClient.get(baseUrl + topicPicUrl,
          options: Options(responseType: ResponseType.plain));
      if (response.statusCode == 200) {
        var jsonString = response.data.toString();
        final topicPicsModel = topicPicModelFromJson(jsonString);
        return topicPicsModel;
      } else
        print('erro -get');
      return null;
    } catch (error) {
      print(error);
    }
  }

  Future<List<CollectionModel>> getCollection() async {
    String collectionUrl = "collections/?client_id=$apiKey&per_page=30";
    try {
      var response = await httpClient.get(baseUrl + collectionUrl,
          options: Options(responseType: ResponseType.plain));
      if (response.statusCode == 200) {
        var jsonString = response.data.toString();
        final collectionModel = collectionModelFromJson(jsonString);
        return collectionModel;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

// ignore: missing_return
  Future<List<CollectionDetailModel>> getCollectionDetail(collectionId) async {
    String collectionDetailUrl =
        "collections/$collectionId/photos/?client_id=$apiKey&per_page=50";
    try {
      var response = await httpClient.get(baseUrl + collectionDetailUrl,
          options: Options(responseType: ResponseType.plain));
      var jsonString = response.data.toString();
      print(jsonString);
      var collectionDetailModel = collectionDetailModelFromJson(jsonString);
      return collectionDetailModel;
    } catch (e) {
      Future.error(e.toString());
    }
  }
}
