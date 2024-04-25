import 'package:camera/camera.dart';

class CameraUtils {
  Future<CameraController> getCameraController(
      {required ResolutionPreset resolutionPreset,
      required CameraLensDirection cameraLensDirection}) async {
    final cameras = await availableCameras();
    final camera = cameras
        .firstWhere((camera) => camera.lensDirection == cameraLensDirection);

    return CameraController(camera, resolutionPreset, enableAudio: false);
  }
}
