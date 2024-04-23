import 'package:flutter/material.dart';

double screenHeight({required BuildContext context}) {
  return MediaQuery.of(context).size.height;
}

double screenWidth({required BuildContext context}) {
  return MediaQuery.of(context).size.width;
}
