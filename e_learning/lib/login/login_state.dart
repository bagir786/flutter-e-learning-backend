part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

final class LoginScucces extends LoginState {
  final LoginResponse loginResponse;

  LoginScucces(this.loginResponse);
}

final class LoginFailed extends LoginState {
  final String message;

  LoginFailed(this.message);
}

final class LoginInProgres extends LoginState{}
