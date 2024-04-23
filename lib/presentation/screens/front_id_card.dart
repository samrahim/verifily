import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:verifily/presentation/screens/verification_front_id_card.dart';

class PickFrontIdCardImage extends StatefulWidget {
  const PickFrontIdCardImage({
    super.key,
  });

  @override
  _PickFrontIdCardImageState createState() => _PickFrontIdCardImageState();
}

class _PickFrontIdCardImageState extends State<PickFrontIdCardImage> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
        const CameraDescription(
            name: '0',
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
                    'Front ID Card',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    width: MediaQuery.of(context).size.width - 16,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Your ID Card Content',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _controller.takePicture().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerificationFrontIdCard(
                                      cardIdPath: value.path,
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
