part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

final class LoginButtonPressed extends LoginEvent {
  final String identifier;
  final String password;

  LoginButtonPressed(this.identifier, this.password);
}
