import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:dio/dio.dart';

class ImageSaver {
  save(imageUrl, imageName) async {
    var response = await Dio()
        .get(imageUrl, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 100,
        name: imageName);
    print(result);
  }
}
