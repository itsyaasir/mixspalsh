import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:unspalsh_app/models/photo_model.dart';
import 'package:unspalsh_app/models/topic_pic_model.dart';
import 'package:unspalsh_app/models/topics_model.dart';

// const apiKey = "c2vhGEb8K_UnUzG7cL18r5R8hH5wkDzOfGYLaTWwYqM";
const getPhotoUrl =
    'https://api.unsplash.com/photos/?client_id=$apiKey&per_page=100';
const getTopicUrl =
    'https://api.unsplash.com/topics/?client_id=$apiKey&per_page=100';

// API FOR GETTING PHOTOS
class MyApiClient {
  static var client = http.Client();
  static Future<List<PhotoModel>> getPhoto() async {
    try {
      var response = await client.get(getPhotoUrl);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        final photoModel = photoModelFromJson(jsonString);
        // return photoModelFromJson(jsonString);
        return photoModel;
      } else {
        print('erro -get');
        return null;
      }
    } catch (error) {
      print(error);
    } finally {
      print("Reached Here at Photos");
    }
  }

  static Future<List<TopicModel>> getTopic() async {
    try {
      var response = await client.get(getTopicUrl);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        final topicModel = topicModelFromJson(jsonString);
        // return topicModelFromJson(jsonString);
        return topicModel;
      } else {
        print('erro -get');
        return null;
      }
    } catch (error) {
      print(error);
    } finally {
      print("Reached Here at Topics");
    }
  }

  static Future<List<TopicPicModel>> getTopicPic() async {
    String getTopicPicUrl =
        'https://api.unsplash.com/topics/${Get.arguments[0]}/photos/?client_id=$apiKey&per_page=100';
    try {
      var response = await client.get(getTopicPicUrl);
      print(Get.arguments[0]);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        final topicPicModel = topicPicModelFromJson(jsonString);
        // return topicModelFromJson(jsonString);
        return topicPicModel;
      } else {
        print('erro -get');
        return null;
      }
    } catch (error) {
      print(error);
    } finally {
      print("Reached Here At Topic Photos ");
    }
  }
}
