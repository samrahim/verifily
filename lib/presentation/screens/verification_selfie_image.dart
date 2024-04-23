import 'dart:io';

import 'package:flutter/material.dart';
import 'package:verifily/outils/width_height.dart';
import 'package:verifily/presentation/const.dart';
import 'package:verifily/presentation/screens/back_id_card.dart';
import 'package:verifily/presentation/screens/final_screen.dart';
import 'package:verifily/presentation/screens/front_id_card.dart';
import 'package:verifily/presentation/screens/pick_selfie_image.dart';

import 'package:verifily/presentation/widgets/inkwellveri.dart';

class VerificationSelfieImage extends StatefulWidget {
  final String selfieImagePath;
  const VerificationSelfieImage({super.key, required this.selfieImagePath});

  @override
  State<VerificationSelfieImage> createState() => _VerificationIdCardState();
}

class _VerificationIdCardState extends State<VerificationSelfieImage> {
  @override
  Widget build(BuildContext context) {
    final scal = screenWidth(context: context) / 360;

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Selfie card",
              style: titleTextStyle(scal, Colors.black),
            ),
            SizedBox(
                height: screenHeight(context: context) / 2,
                width: screenWidth(context: context) - 20,
                child: Image.file(
                  File(widget.selfieImagePath),
                  fit: BoxFit.cover,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkVerification(
                    widht: screenHeight(context: context) / 5,
                    function: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PickSelfieImage()));
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
                              builder: (context) => const FinalScreen()));
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
