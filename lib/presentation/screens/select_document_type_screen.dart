import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:verifily/outils/width_height.dart';
import 'package:verifily/presentation/const.dart';
import 'package:verifily/presentation/screens/front_id_card.dart';
import 'package:verifily/presentation/screens/passeport_img.dart';

class SelectDocumentTypeScreen extends StatefulWidget {
  const SelectDocumentTypeScreen({super.key});

  @override
  State<SelectDocumentTypeScreen> createState() =>
      _SelectDocumentTypeScreenState();
}

class _SelectDocumentTypeScreenState extends State<SelectDocumentTypeScreen> {
  @override
  Widget build(BuildContext context) {
    final scaleFac = screenWidth(context: context) / 360;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: screenHeight(context: context) / 16),
            Text("Choose Document",
                style: titleTextStyle(scaleFac, Colors.black)),
            Text("Type", style: titleTextStyle(scaleFac, Colors.black)),
            SizedBox(height: screenHeight(context: context) / 16),
            InkWell(
              onTap: () async {
                await availableCameras().then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PickFrontIdCardImage())));
              },
              child: SizedBox(
                height: screenHeight(context: context) / 10,
                width: screenWidth(context: context) - 16,
                child: Card(
                  color: Colors.blue.shade600,
                  elevation: 12,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ID CARD",
                          style: TextStyle(
                              color: Colors.white, fontSize: 20 * scaleFac),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                          size: 20 * scaleFac,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight(context: context) / 20),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PickPasseportImage()));
              },
              child: SizedBox(
                height: screenHeight(context: context) / 10,
                width: screenWidth(context: context) - 16,
                child: Card(
                  color: Colors.blue.shade600,
                  elevation: 12,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Passport",
                          style: TextStyle(
                              color: Colors.white, fontSize: 20 * scaleFac),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                          size: 20 * scaleFac,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
