import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:verifily/repositories/auth_repository.dart';
import 'package:verifily/repositories/images_paths.dart';
part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthRepository repository;
  ImagesPaths paths;
  AuthBlocBloc({required this.repository, required this.paths})
      : super(AuthBlocInitial()) {
    on<RegisterWithFullNameEvent>((event, emit) async {
      emit(RegisterCustomerLoading());
      try {
        await repository
            .registerCostumer(fullname: event.fullName)
            .then((value) {
          if (value.statusCode == 200) {
            Map<String, dynamic> data = json.decode(value.body);
            repository.currentCustomerId = data['Customer ID'];
            emit(RegisterCustomerSuccess());
          } else {
            emit(RegisterCustomerFailed());
          }
        });
      } catch (e) {
        emit(RegisterCustomerFailed());
      }
    });

    on<SendFrontAndBackIdCardsEvent>((event, emit) async {
      emit(SendCardIdLoading());
      try {
        print("back images paths ${paths.backIdPath}");
        print("fron images paths ${paths.frontIdPath}");

        await repository
            .sendFrontAndBackId(
                customerId: repository.currentCustomerId,
                frontId: paths.frontIdPath!,
                backId: paths.backIdPath!)
            .then((val) async {
          val.stream.bytesToString().then((value) {
            print(value);
          });
          if (val.statusCode == 200) {
            emit(SendCardIdSuccess());
          } else {
            emit(SendCardIdFailed(error: await val.stream.bytesToString()));
          }
        });
      } catch (e) {
        emit(SendCardIdFailed(error: e.toString()));
      }
    });
    on<SendSelfiImageEvent>((event, emit) async {
      emit(SendSelfieImageLoading());
      try {
        await repository
            .sendSelfiImageRequest(
                customerId: repository.currentCustomerId,
                faceImagePath: event.selfiImage)
            .then((valuee) async {
          print("response of send image $valuee");
          if (valuee.statusCode == 200) {
            await repository.sendInspectionRequest(
                customerId: repository.currentCustomerId);
            emit(OperationCompleted());
          } else {
            emit(SendSelfieImageFailed(
                err: await valuee.stream.bytesToString()));
          }
        });
      } catch (e) {
        emit(SendSelfieImageFailed(err: e.toString()));
      }
    });
  }
}
