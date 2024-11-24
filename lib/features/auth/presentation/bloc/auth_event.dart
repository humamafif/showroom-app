part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {}

class LoggedInEvent extends AuthEvent {
  final String token;
  final String username;
  final String password;

  LoggedInEvent(
      {this.token = "", required this.username, required this.password});
  @override
  List<Object?> get props => [token, username, password];
}

class RegisterEvent extends AuthEvent {
  final RegisterParams registerParams;

  RegisterEvent({required this.registerParams});
  @override
  List<Object?> get props => [registerParams];
}

class LoggedOut extends AuthEvent {}
