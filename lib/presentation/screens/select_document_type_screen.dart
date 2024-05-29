import 'package:flutter/material.dart';
import 'package:verifily/outils/width_height.dart';
import 'package:verifily/presentation/screens/front_id_card.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: screenHeight(context: context) / 16),
                  FittedBox(
                    child: Text("Choose document type",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  ),
                  SizedBox(height: screenHeight(context: context) / 16),
                  InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PickFrontIdCardImage()));
                    },
                    child: SizedBox(
                      height: screenHeight(context: context) / 10,
                      child: Card(
                        color: const Color.fromRGBO(21, 115, 254, 1),
                        elevation: 12,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "ID CARD",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20 * scaleFac),
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
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             const PickPasseportImage()));
                    },
                    child: SizedBox(
                      height: screenHeight(context: context) / 10,
                      width: screenWidth(context: context) - 16,
                      child: Card(
                        color: const Color.fromRGBO(21, 115, 254, 1),
                        elevation: 12,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "PASSPORT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20 * scaleFac),
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
                ],
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Powered by ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromARGB(255, 237, 207, 242)),
                      child: const Text(
                        "Verifili",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
