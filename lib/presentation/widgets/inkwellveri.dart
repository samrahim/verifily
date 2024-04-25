import 'package:flutter/material.dart';
import 'package:verifily/outils/width_height.dart';
import 'package:verifily/const.dart';

class InkVerification extends StatefulWidget {
  final double widht;
  final void Function()? function;
  final String title;
  final bool isContinue;
  const InkVerification(
      {super.key,
      required this.widht,
      required this.title,
      required this.isContinue,
      required this.function});

  @override
  State<InkVerification> createState() => _InkVerificationState();
}

class _InkVerificationState extends State<InkVerification> {
  @override
  Widget build(BuildContext context) {
    final scal = screenHeight(context: context) / 360;
    return InkWell(
      onTap: widget.function,
      child: Container(
        decoration: BoxDecoration(
            color: widget.isContinue
                ? const Color.fromRGBO(21, 115, 254, 1)
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12)),
        width: widget.widht,
        height: 40,
        child: Center(
            child: Text(
          widget.title,
          style: buttonsTextStyle(scal, Colors.white),
        )),
      ),
    );
  }
}
