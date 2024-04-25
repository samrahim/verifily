part of 'camera_blo_c_bloc.dart';

abstract class CameraBloCEvent extends Equatable {}

class CameraInitialized extends CameraBloCEvent {
  final List<CameraDescription> cameras;
  CameraInitialized({required this.cameras});
  @override
  List<Object?> get props => [];
}

class CameraStopped extends CameraBloCEvent {
  @override
  List<Object?> get props => [];
}

class CameraPickedImage extends CameraBloCEvent {
  @override
  List<Object?> get props => [];
}

class CameraChangeSide extends CameraBloCEvent {
  @override
  List<Object?> get props => [];
}
