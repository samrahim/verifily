import 'package:flutter/material.dart';
import 'package:verifily/outils/width_height.dart';
import 'package:verifily/const.dart';
import 'package:verifily/presentation/screens/register_screen.dart';
import 'package:verifily/presentation/widgets/inkwellveri.dart';

class FinalScreen extends StatefulWidget {
  const FinalScreen({super.key});

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              color: Colors.white,
              height: screenHeight(context: context),
              width: screenWidth(context: context),
            ),
            Container(
              height: screenHeight(context: context) / 3,
              decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(200, 70),
                  )),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60)),
                      child: Image.asset(
                        'images/—Pngtree—green check mark in circle_9024765.png',
                        height: MediaQuery.of(context).size.height / 3,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(height: 10),
                  Text(
                    "Excellent job !!",
                    style: titleTextStyle(
                        screenWidth(context: context) / 360, Colors.black),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "We are verifying ",
                    style: titleTextStyle(
                        screenWidth(context: context) / 360, Colors.black),
                  ),
                  Text(
                    "your information",
                    style: titleTextStyle(
                        screenWidth(context: context) / 360, Colors.black),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "It may take up to ",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    "24 hours...",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: InkVerification(
                      function: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()));
                      },
                      isContinue: true,
                      title: "BACK TO HOME",
                      widht: screenWidth(context: context),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
