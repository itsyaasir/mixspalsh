import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextComponent extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;
  final double letterSpacing;

  const TextComponent(
      {Key key,
      @required this.title,
      @required this.fontSize,
      this.color,
      this.letterSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.bebasNeue(
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        color: color,
      ),
    );
  }
}
