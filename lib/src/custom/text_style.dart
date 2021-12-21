import 'package:flutter/material.dart';

Widget text(String s, double fontSize, Color color) {
  final TextStyle textStyle = TextStyle(
    fontFamily: 'Montserrat',
    letterSpacing: 2,
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeight.w500,
  );
  return Text(s, style: textStyle);
}
