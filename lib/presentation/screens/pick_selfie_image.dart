import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:verifily/presentation/screens/verification_front_id_card.dart';
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
        const CameraDescription(
            name: "1",
            lensDirection: CameraLensDirection.front,
            sensorOrientation: 0),
        ResolutionPreset.high);
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
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: CameraPreview(_controller)),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Selfie Image',
                    style: TextStyle(
                        fontSize: 28.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'Please point the camera at your face',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: CustomPaint(
                      size: Size(
                        MediaQuery.of(context).size.width - 60,
                        MediaQuery.of(context).size.height / 2,
                      ),
                      painter: MyPaint(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          await _controller.takePicture().then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        VerificationSelfieImage(
                                          selfieImagePath: value.path,
                                        )));
                          });
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 4),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(70)),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(21, 115, 254, 1),
                                  borderRadius: BorderRadius.circular(70)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 3.5),
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
                                      lensDirection: CameraLensDirection.front,
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
                            Icons.flip_camera_ios_rounded,
                            color: Color.fromRGBO(21, 115, 254, 1),
                            size: 40,
                          )),
                      const SizedBox(width: 12)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;

    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: size.width - 60,
            height: size.height),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}
