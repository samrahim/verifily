import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verifily/blocs/auth/auth_bloc_bloc.dart';
import 'package:verifily/blocs/imagespath/images_path_bloc.dart';
import 'package:verifily/outils/width_height.dart';
import 'package:verifily/const.dart';
import 'package:verifily/presentation/screens/back_id_card.dart';
import 'package:verifily/presentation/screens/pick_selfie_image.dart';
import 'package:verifily/presentation/screens/select_document_type_screen.dart';
import 'package:verifily/presentation/widgets/inkwellveri.dart';
import 'package:verifily/presentation/widgets/loading_widget.dart';

class VerificationBackIdCard extends StatefulWidget {
  final String backcardIdPath;
  const VerificationBackIdCard({super.key, required this.backcardIdPath});

  @override
  State<VerificationBackIdCard> createState() => _VerificationIdCardState();
}

class _VerificationIdCardState extends State<VerificationBackIdCard> {
  @override
  void initState() {
    print("back image size");
    printImageSize(widget.backcardIdPath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scal = screenWidth(context: context) / 360;

    return SafeArea(
        child: Scaffold(
      body: BlocConsumer<AuthBlocBloc, AuthBlocState>(
        builder: (context, state) {
          if (state is SendCardIdLoading) {
            return const Center(child: LoadingWidget());
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Your back ID Card",
                      style: titleTextStyle(scal, Colors.black),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Image.file(
                        File(widget.backcardIdPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              title: "TRY AGAIN"),
                          SizedBox(
                            width: screenWidth(context: context) * 0.1,
                          ),
                          InkVerification(
                            widht: screenHeight(context: context) / 5,
                            title: "CONTINUE",
                            isContinue: true,
                            function: () {
                              context.read<ImagesPathBloc>().add(SaveBackIdCard(
                                  backIdPath: widget.backcardIdPath));
                              BlocProvider.of<AuthBlocBloc>(context)
                                  .add(SendFrontAndBackIdCardsEvent());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
        listener: (context, state) {
          if (state is SendCardIdSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PickSelfieImage()));
          } else if (state is SendCardIdFailed) {
            showDialog(
              context: context,
              builder: (c) => AlertDialog(
                title: const Text('Error'),
                content: const Text(
                    'The quality of the ID card images is not accepted.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(c).pop();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SelectDocumentTypeScreen()),
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
    ));
  }
}
