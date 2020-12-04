import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const CircularProgressIndicator(
        backgroundColor: Colors.white,
        valueColor: const AlwaysStoppedAnimation(Colors.black),
      ),
    );
  }
}
