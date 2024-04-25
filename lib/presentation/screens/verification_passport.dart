import 'dart:io';

import 'package:flutter/material.dart';
import 'package:verifily/outils/width_height.dart';
import 'package:verifily/const.dart';
import 'package:verifily/presentation/screens/passeport_img.dart';
import 'package:verifily/presentation/widgets/inkwellveri.dart';

class VerificationPasseportImage extends StatefulWidget {
  final String cardIdPath;
  const VerificationPasseportImage({super.key, required this.cardIdPath});

  @override
  State<VerificationPasseportImage> createState() => _VerificationIdCardState();
}

class _VerificationIdCardState extends State<VerificationPasseportImage> {
  @override
  Widget build(BuildContext context) {
    final scal = screenWidth(context: context) / 360;

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Passport",
              style: titleTextStyle(scal, Colors.black),
            ),
            SizedBox(
              height: screenHeight(context: context) / 2,
              width: screenWidth(context: context) - 20,
              child: Image.file(
                File(widget.cardIdPath),
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkVerification(
                    widht: screenHeight(context: context) / 5,
                    function: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PickPasseportImage()));
                    },
                    isContinue: false,
                    title: "Try Again"),
                InkVerification(
                    widht: screenHeight(context: context) / 5,
                    title: "Continue",
                    isContinue: true,
                    function: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}
