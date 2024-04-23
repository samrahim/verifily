import 'dart:io';

import 'package:flutter/material.dart';
import 'package:verifily/outils/width_height.dart';
import 'package:verifily/presentation/const.dart';
import 'package:verifily/presentation/screens/back_id_card.dart';
import 'package:verifily/presentation/screens/pick_selfie_image.dart';
import 'package:verifily/presentation/widgets/inkwellveri.dart';

class VerificationBackIdCard extends StatefulWidget {
  final String cardIdPath;
  const VerificationBackIdCard({super.key, required this.cardIdPath});

  @override
  State<VerificationBackIdCard> createState() => _VerificationIdCardState();
}

class _VerificationIdCardState extends State<VerificationBackIdCard> {
  @override
  Widget build(BuildContext context) {
    final scal = screenWidth(context: context) / 360;

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Back Id card",
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
                                  const PickBackImageIdCard()));
                    },
                    isContinue: false,
                    title: "Try Again"),
                InkVerification(
                    widht: screenHeight(context: context) / 5,
                    title: "Continue",
                    isContinue: true,
                    function: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PickSelfieImage()));
                    })
              ],
            )
          ],
        ),
      ),
    );
  }

  String formatBytes(int bytes) {
    const int KB = 1024;
    const int MB = KB * 1024;

    if (bytes >= MB) {
      return '${(bytes / MB).toStringAsFixed(2)} MB';
    } else if (bytes >= KB) {
      return '${(bytes / KB).toStringAsFixed(2)} KB';
    } else {
      return '$bytes bytes';
    }
  }
}
