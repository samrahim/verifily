import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:verifily/blocs/auth/auth_bloc_bloc.dart';
import 'package:verifily/outils/width_height.dart';
import 'package:verifily/const.dart';
import 'package:verifily/presentation/screens/final_screen.dart';
import 'package:verifily/presentation/screens/pick_selfie_image.dart';

import 'package:verifily/presentation/widgets/inkwellveri.dart';
import 'package:verifily/presentation/widgets/loading_widget.dart';

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
        body: BlocConsumer<AuthBlocBloc, AuthBlocState>(
          builder: (context, state) {
            if (state is SendSelfieImageLoading) {
              return const Center(
                child: LoadingWidget(),
              );
            } else {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Your Selfie",
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
                                        builder: (context) =>
                                            const PickSelfieImage()));
                              },
                              isContinue: false,
                              title: "TRY AGAIN"),
                          InkVerification(
                              widht: screenHeight(context: context) / 5,
                              title: "CONTINUE",
                              isContinue: true,
                              function: () {
                                BlocProvider.of<AuthBlocBloc>(context).add(
                                    SendSelfiImageEvent(
                                        selfiImage: widget.selfieImagePath));
                              })
                        ])
                  ]);
            }
          },
          listener: (context, state) {
            if (state is SendCardIdSuccess) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FinalScreen()));
            } else if (state is SendSelfieImageFailed) {
              showDialog(
                context: context,
                builder: (ce) => AlertDialog(
                  title: const Text('Error'),
                  content: const Text('Invalid Front Image file format'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ce);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PickSelfieImage()),
                        );
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
