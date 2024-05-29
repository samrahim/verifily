import 'package:flutter/material.dart';

TextStyle titleTextStyle(double scal, Color color) {
  return TextStyle(
    fontSize: 23 * scal,
    fontWeight: FontWeight.w500,
    color: color,
  );
}

TextStyle bigTextStyle(double scal, Color color) {
  return TextStyle(
    fontSize: 30 * scal,
    fontWeight: FontWeight.w500,
    color: color,
  );
}

TextStyle subtitleTextStyle(double scal, Color color) {
  return TextStyle(
    fontSize: 16 * scal,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle buttonsTextStyle(double scal, Color color) {
  return TextStyle(
    fontSize: 8 * scal,
    fontWeight: FontWeight.w500,
    color: color,
  );
}

const String baseUrl = 'https://api.verifili.pro/v1';

const String token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiOWI1MWZkNzItYzQwNy00ODFlLWFkZmQtZDQ2MDU0ZjMzYjE0Iiwicm9sZSI6ImNvbXBhbnkiLCJleHAiOjE3NDg1NTY5NjR9.nb15ABDWHqXsm0ANqIC5cbU9U9p14RAusq_iup75fGE';
