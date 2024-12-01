abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String username;
  final String password;

  AuthLoginEvent({required this.username, required this.password});
}

class AuthRegisterEvent extends AuthEvent {
  final String username;
  final String password;

  AuthRegisterEvent({required this.username, required this.password});
}

class AuthLogoutEvent extends AuthEvent {}

// UPDATE
class AuthUpdateUserEvent extends AuthEvent {
  final String newUsername, id;

  AuthUpdateUserEvent({required this.newUsername, required this.id});
}
