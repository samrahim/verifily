part of 'auth_bloc_bloc.dart';

abstract class AuthBlocState extends Equatable {}

class AuthBlocInitial extends AuthBlocState {
  @override
  List<Object?> get props => [];
}

class RegisterCustomerLoading extends AuthBlocState {
  @override
  List<Object?> get props => [];
}

class RegisterCustomerSuccess extends AuthBlocState {
  @override
  List<Object?> get props => [];
}

class RegisterCustomerFailed extends AuthBlocState {
  @override
  List<Object?> get props => [];
}

class SendCardIdLoading extends AuthBlocState {
  @override
  List<Object?> get props => [];
}

class SendCardIdSuccess extends AuthBlocState {
  @override
  List<Object?> get props => [];
}

class SendCardIdFailed extends AuthBlocState {
  final String error;

  SendCardIdFailed({required this.error});
  @override
  List<Object?> get props => [];
}

class SendSelfieImageLoading extends AuthBlocState {
  @override
  List<Object?> get props => [];
}

class SendSelfieImageFailed extends AuthBlocState {
  final String err;

  SendSelfieImageFailed({required this.err});
  @override
  List<Object?> get props => [err];
}

class OperationCompleted extends AuthBlocState {
  @override
  List<Object?> get props => [];
}
