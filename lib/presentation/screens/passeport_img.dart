import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:verifily/outils/width_height.dart';
import 'package:verifily/const.dart';
import 'package:verifily/presentation/screens/verification_passport.dart';

class PickPasseportImage extends StatefulWidget {
  const PickPasseportImage({Key? key}) : super(key: key);

  @override
  _PickPasseportImageState createState() => _PickPasseportImageState();
}

class _PickPasseportImageState extends State<PickPasseportImage> {
  late CameraController cameraController;
  late Future<void> initController;

  @override
  void initState() {
    super.initState();

    cameraController = CameraController(
      const CameraDescription(
        name: "0",
        lensDirection: CameraLensDirection.back,
        sensorOrientation: 0,
      ),
      ResolutionPreset.high,
    );
    initController = cameraController.initialize().then((_) {
      cameraController.setZoomLevel(0.9);
      setState(() {});
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scal = screenWidth(context: context) / 360;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade600,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              FutureBuilder(
                future: initController,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    double aspectRatio = 5.3 / 8.5;
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                      child: AspectRatio(
                        aspectRatio: aspectRatio,
                        child: CameraPreview(cameraController),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('First Passport Page',
                          style: titleTextStyle(scal, Colors.white)),
                      Text(
                        'Please point the camera at the first Passport Page',
                        style: subtitleTextStyle(scal, Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight(context: context) / 1.5),
                  ElevatedButton(
                    onPressed: () async {
                      await initController;
                      await cameraController.takePicture().then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerificationPasseportImage(
                              cardIdPath: value.path,
                            ),
                          ),
                        );
                      });
                    },
                    child: const Text('Capture Image'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
