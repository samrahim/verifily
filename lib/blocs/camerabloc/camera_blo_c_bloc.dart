import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'camera_blo_c_event.dart';
part 'camera_blo_c_state.dart';

class CameraBloCBloc extends Bloc<CameraBloCEvent, CameraBloCState> {
  CameraBloCBloc() : super(CameraBloCInitial()) {
    on<CameraBloCEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
