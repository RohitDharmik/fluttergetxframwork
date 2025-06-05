import 'package:flutter/painting.dart';

TextStyle customTextStyle({
  double fontSize = 16,
  Color color = const Color(0xFF000000),
  FontWeight fontWeight = FontWeight.normal,
  double letterSpacing = 0.5,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
  );
}

class TestStyle {
  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    color: Color(0xFF000000),
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    color: Color(0xFF666666),
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    color: Color(0xFF333333),
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    color: Color(0xFFFFFFFF),
  );
}
