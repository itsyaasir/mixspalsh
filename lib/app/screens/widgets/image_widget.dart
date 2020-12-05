import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final String hashBlur;
  final double height;
  final double width;
  final colorBlendMode;

  const ImageWidget({
    @required this.imageUrl,
    @required this.hashBlur,
    this.height,
    this.width,
    this.colorBlendMode,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OctoImage(
      
      image: CachedNetworkImageProvider(imageUrl),
      placeholderBuilder: OctoPlaceholder.blurHash(
        hashBlur,
      ),
      errorBuilder: OctoError.icon(color: Colors.red),
      fit: BoxFit.cover,
      height: height,
      width: width,
      colorBlendMode: colorBlendMode,

    );
  }
}
