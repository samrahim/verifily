import 'dart:io';

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
    fontSize: 32 * scal,
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
    fontSize: 10 * scal,
    fontWeight: FontWeight.w500,
    color: color,
  );
}

const String baseUrl = 'https://api.verifili.pro/v1';

const String token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiODdjNTQ0MzYtY2Q5Yy00NGIzLTkzNWMtMTA5M2M0YTBkY2E5Iiwicm9sZSI6ImNvbXBhbnkiLCJleHAiOjE3NDQ1Njk1MjV9.fo3NRngUtIJpOT9zSfaDT8DvmX9-2GuKblYEJHKE5lM';

Future<void> printImageSize(String imagePath) async {
  try {
    File imageFile = File(imagePath);
    int sizeInBytes = await imageFile.length();

    // Convert size to KB or MB
    double sizeInKB = sizeInBytes / 1024; // Convert bytes to KB
    double sizeInMB = sizeInKB / 1024; // Convert KB to MB

    // Print size in KB or MB
    if (sizeInMB >= 1) {
      print('Image size: ${sizeInMB.toStringAsFixed(2)} MB');
    } else {
      print('Image size: ${sizeInKB.toStringAsFixed(2)} KB');
    }
  } catch (e) {
    print('Error getting image size: $e');
  }
}
