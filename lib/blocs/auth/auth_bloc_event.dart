part of 'auth_bloc_bloc.dart';

abstract class AuthBlocEvent extends Equatable {}

class RegisterWithFullNameEvent extends AuthBlocEvent {
  final String fullName;
  final String email;
  RegisterWithFullNameEvent({required this.email, required this.fullName});
  @override
  List<Object?> get props => [fullName];
}

class SendFrontAndBackIdCardsEvent extends AuthBlocEvent {
  SendFrontAndBackIdCardsEvent();

  @override
  List<Object?> get props => [];
}

class SendSelfiImageEvent extends AuthBlocEvent {
  final String selfiImage;

  SendSelfiImageEvent({required this.selfiImage});
  @override
  List<Object?> get props => [selfiImage];
}

class AuthProcCompleteSucc extends AuthBlocEvent {
  @override
  List<Object?> get props => [];
}
