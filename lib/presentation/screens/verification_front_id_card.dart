import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verifily/blocs/imagespath/images_path_bloc.dart';
import 'package:verifily/outils/width_height.dart';
import 'package:verifily/const.dart';
import 'package:verifily/presentation/screens/back_id_card.dart';
import 'package:verifily/presentation/screens/front_id_card.dart';

import 'package:verifily/presentation/widgets/inkwellveri.dart';

class VerificationFrontIdCard extends StatefulWidget {
  final String cardIdPath;
  const VerificationFrontIdCard({super.key, required this.cardIdPath});

  @override
  State<VerificationFrontIdCard> createState() => _VerificationIdCardState();
}

class _VerificationIdCardState extends State<VerificationFrontIdCard> {
  @override
  void initState() {
    print("back image size");
    printImageSize(widget.cardIdPath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scal = screenWidth(context: context) / 360;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Your front ID Card",
                  style: titleTextStyle(scal, Colors.black),
                ),
                SizedBox(
                    height: screenHeight(context: context) / 2,
                    width: screenWidth(context: context) - 20,
                    child: Image.file(
                      File(widget.cardIdPath),
                      fit: BoxFit.cover,
                    )),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkVerification(
                          widht: screenHeight(context: context) / 5,
                          function: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PickFrontIdCardImage()));
                          },
                          isContinue: false,
                          title: "TRY AGAIN"),
                      SizedBox(
                        width: screenWidth(context: context) * 0.1,
                      ),
                      InkVerification(
                          widht: screenHeight(context: context) / 5,
                          title: "CONTINUE",
                          isContinue: true,
                          function: () {
                            BlocProvider.of<ImagesPathBloc>(context).add(
                                SaveFronIdCardPath(
                                    frontIdPath: widget.cardIdPath));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PickBackImageIdCard()));
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//  String formatBytes(int bytes) {
//      int kb = 1024;
//      int mb = KB * 1024;

//     if (bytes >= MB) {
//       return '${(bytes / MB).toStringAsFixed(2)} mb';
//     } else if (bytes >= KB) {
//       return '${(bytes / KB).toStringAsFixed(2)} kb';
//     } else {
//       return '$bytes we dont know !';
//     }
//   }