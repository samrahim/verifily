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
        await repository
            .sendFrontAndBackId(
                customerId: repository.currentCustomerId,
                frontId: paths.frontIdPath!,
                backId: paths.backIdPath!)
            .then((val) {
          if (val == 200) {
            emit(SendCardIdSuccess());
          } else {
            emit(SendCardIdFailed(error: "val"));
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
            .then((value) async {
          if (value == 200) {
            emit(SendCardIdSuccess());
            await repository.sendInspectionRequest(
                customerId: repository.currentCustomerId);
          } else {
            emit(SendSelfieImageFailed(err: "Invalid Front Image file format"));
          }
        });
      } catch (e) {
        emit(SendSelfieImageFailed(err: e.toString()));
      }
    });
  }
}
