import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Your selfie",
                          style: titleTextStyle(scal, Colors.black),
                        ),
                        SizedBox(
                          height: screenHeight(context: context) / 2,
                          width: screenWidth(context: context) - 20,
                          child: Transform.rotate(
                            angle: 4 * pi,
                            child: Image.file(
                              File(widget.selfieImagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
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
                                                  const PickSelfieImage()));
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
                                      BlocProvider.of<AuthBlocBloc>(context)
                                          .add(SendSelfiImageEvent(
                                              selfiImage:
                                                  widget.selfieImagePath));
                                    })
                              ]),
                        )
                      ]),
                ),
              );
            }
          },
          listener: (context, state) {
            if (state is OperationCompleted) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FinalScreen()));
            } else if (state is SendSelfieImageFailed) {
              showDialog(
                context: context,
                builder: (ce) => AlertDialog(
                  title: const Text('Error'),
                  content:
                      Text('Invalid Front Image file format \n ${state.err}'),
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
