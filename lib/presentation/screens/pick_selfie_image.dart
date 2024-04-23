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

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
        const CameraDescription(
            name: '1',
            lensDirection: CameraLensDirection.back,
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
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.height / 2.5,
                    height: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(300),
                        border: Border.all(color: Colors.white, width: 1.5)),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _controller.takePicture().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerificationSelfieImage(
                                      selfieImagePath: value.path,
                                    )));
                      });
                    },
                    child: const Text('Take Picture'),
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
