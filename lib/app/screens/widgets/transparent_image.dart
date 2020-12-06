import 'package:flutter/material.dart';

class TransparentImage extends StatelessWidget {
  final Widget child;
  TransparentImage({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.7),
          BlendMode.dstATop,
        ),
        child: child,
      ),
    );
  }
}
