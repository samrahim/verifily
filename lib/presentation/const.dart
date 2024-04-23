import 'package:flutter/material.dart';

TextStyle titleTextStyle(double scal, Color color) {
  return TextStyle(
    fontSize: 32 * scal,
    fontWeight: FontWeight.w500,
    color: color,
  );
}

TextStyle subtitleTextStyle(double scal, Color color) {
  return TextStyle(
    fontSize: 14 * scal,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle buttonsTextStyle(double scal, Color color) {
  return TextStyle(
    fontSize: 10 * scal,
    fontWeight: FontWeight.w500,
    color: color,
  );
}
