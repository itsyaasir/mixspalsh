// import 'package:get/get.dart';
// import 'package:dio/dio.dart';
// import 'package:unspalsh_app/app/env/env.dart';
// import 'package:unspalsh_app/app/data/models/photo_details.dart';
// import 'package:unspalsh_app/app/data/models/photo_model.dart';
// import 'package:unspalsh_app/app/data/models/topic_pic_model.dart';
// import 'package:unspalsh_app/app/data/models/topics_model.dart';

// // Better Immplementation for APIKEY
// // API KEY no longer exposed
// const apiKey = Env.apikey;
// const getPhotoUrl =
//     'https://api.unsplash.com/photos/?client_id=$apiKey&per_page=100';
// const getTopicUrl =
//     'https://api.unsplash.com/topics/?client_id=$apiKey&per_page=100';

// // API FOR GETTING PHOTOS
// class MyApiClient {
//   static Dio dio = new Dio();

//   static Future<List<PhotoModel>> getPhoto() async {
//     try {
//       var response = await dio.get(getPhotoUrl,
//           options: Options(responseType: ResponseType.plain));
//       if (response.statusCode == 200) {
//         var jsonString = response.data.toString();
//         final photoModel = photoModelFromJson(jsonString);
//         return photoModel;
//       } else {
//         print('error has occured in getPhoto()');
//         return null;
//       }
//     } catch (error) {
//       print(error);
//     } finally {
//       print("Reached Here at Photos");
//     }
//   }

//   static Future<List<TopicModel>> getTopic() async {
//     try {
//       var response = await dio.get(  getTopicUrl,
//           options: Options(responseType: ResponseType.plain));
//       if (response.statusCode == 200) {
//         var jsonString = response.data.toString();
//         final topicModel = topicModelFromJson(jsonString);
//         // return topicModelFromJson(jsonString);
//         return topicModel;
//       } else {
//         print('erro error has occured in getTopic()');
//         return null;
//       }
//     } catch (error) {
//       print(error);
//     } finally {
//       print("Reached Here at Topics");
//     }
//   }

//   static Future<List<TopicPicModel>> getTopicPic() async {
//     String id = Get.arguments[1];
//     print("$id Here you go");
//     String getTopicPicUrl =
//         'https://api.unsplash.com/topics/$id/photos/?client_id=$apiKey&per_page=100';
//     try {
//       var response = await dio.get(getTopicPicUrl,
//           options: Options(responseType: ResponseType.plain));
//       if (response.statusCode == 200) {
//         var jsonString = response.data.toString();
//         final topicPicModel = topicPicModelFromJson(jsonString);
//         return topicPicModel;
//       } else {
//         print('error has occured in getTopicPic()');
//         return null;
//       }
//     } catch (error) {
//       print(error);
//     } finally {
//       print("Reached Here At Topic Photos ");
//     }
//   }

//   static Future<PhotoDetailsModel> getPhotoDetails() async {
//     const photoDetailsUrl = "https://api.unsplash.com/photos/gGm63CSfXAo/?client_id=$apiKey";
//     try {
//       var response = await dio.get(photoDetailsUrl,
//           options: Options(responseType: ResponseType.plain));
//       if (response.statusCode == 200) {
//         var jsonString = response.data.toString();
//         print(jsonString);
//         final photoDetailsModel = photoDetailsModelFromJson(jsonString);
//         return photoDetailsModel;
//       } else {
//         print('error has occured in getTopicPic()');
//         return null;
//       }
//     } catch (error) {
//       print(error);
//     } finally {
//       print("Reached Here At Topic Photos ");
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:unspalsh_app/app/data/models/photo_details.dart';
import 'package:unspalsh_app/app/data/models/photo_model.dart';
import 'package:unspalsh_app/app/env/env.dart';

const apiKey = Env.apikey;
const baseUrl = 'https://api.unsplash.com/';

const PhotoUrl = 'photos/?client_id=$apiKey&per_page=1000';

class MyApiClient {
  final Dio httpClient;
  MyApiClient({@required this.httpClient});

  Future<List<PhotoModel>> getPhotos() async {
    try {
      var response = await httpClient.get(baseUrl + PhotoUrl,
          options: Options(responseType: ResponseType.plain));
      if (response.statusCode == 200) {
        var jsonString = response.data.toString();
        final photoModel = photoModelFromJson(jsonString);
        return photoModel;
      } else
        print('erro -get');
      return null;
    } catch (error) {
      print(error);
    }
  }

  Future<PhotoDetailsModel> getPhotoDetails(id) async {
    print("$id in the function getPhotoDetails()");
    String photoDetailURl = "/photos/$id/?client_id=$apiKey";
    try {
      var response = await httpClient.get(baseUrl + photoDetailURl,
          options: Options(responseType: ResponseType.plain));
      if (response.statusCode == 200) {
        print(response.statusCode);
        var jsonString = response.data.toString();
        print(jsonString);
        final photoDetailsModel = photoDetailsModelFromJson(jsonString);
        return photoDetailsModel;
      } else
        print('erro -get');
      return null;
    } catch (error) {
      print(error);
    }
  }
}
