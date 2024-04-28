import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:verifily/presentation/screens/verification_selfie_image.dart';

class PickSelfieImage extends StatefulWidget {
  const PickSelfieImage({
    super.key,
  });

  @override
  _PickSelfieImageState createState() => _PickSelfieImageState();
}

class _PickSelfieImageState extends State<PickSelfieImage> {
  late CameraController _controller;
  String cameraName = '1';
  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      enableAudio: true,
      const CameraDescription(
          name: "1",
          lensDirection: CameraLensDirection.front,
          sensorOrientation: 270),
      ResolutionPreset.high,
    );
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CameraPreview(
                _controller,
              ),
            ),
            Positioned.fill(
                child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.5,
                  colors: <Color>[
                    Colors.transparent,
                    Colors.white,
                    Colors.black.withOpacity(0.65),
                  ],
                  stops: <double>[01, 1.0, 0.7],
                ),
              ),
            )),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 10),
                    const Text(
                      'Selfie',
                      style: TextStyle(
                          fontSize: 28.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    FittedBox(
                      child: const Text(
                        'Please point the camera at your face',
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 8),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            await _controller.takePicture().then(
                              (value) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        VerificationSelfieImage(
                                      selfieImagePath: value.path,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 4),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(70)),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(21, 115, 254, 1),
                                    borderRadius: BorderRadius.circular(70)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 3.5),
                        InkWell(
                            onTap: () {
                              if (_controller.description.name == "1" &&
                                  _controller.description.lensDirection ==
                                      CameraLensDirection.front) {
                                _controller = CameraController(
                                    enableAudio: true,
                                    const CameraDescription(
                                        name: "0",
                                        lensDirection: CameraLensDirection.back,
                                        sensorOrientation: 0),
                                    ResolutionPreset.veryHigh);
                              } else {
                                _controller = CameraController(
                                    enableAudio: true,
                                    const CameraDescription(
                                        name: "1",
                                        lensDirection:
                                            CameraLensDirection.front,
                                        sensorOrientation: 0),
                                    ResolutionPreset.veryHigh);
                              }
                              _controller.initialize().then((_) {
                                if (!mounted) {
                                  return;
                                }
                                setState(() {});
                              });
                            },
                            child: const Icon(
                              Icons.file_upload_outlined,
                              color: Color.fromRGBO(21, 115, 254, 1),
                              size: 40,
                            )),
                        const SizedBox(width: 12)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
