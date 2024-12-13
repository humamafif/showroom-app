abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthAuthenticatedState extends AuthState {
  final String username, id;

  AuthAuthenticatedState({required this.username, required this.id});
}

class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState({required this.message});
}

class AuthUnauthenticatedState extends AuthState {}

class AuthRegisteredState extends AuthState {
  final String message;

  AuthRegisteredState({required this.message});
}

// UPDATE
class AuthUpdateSuccessState extends AuthState {
  final String message;

  AuthUpdateSuccessState({required this.message});
}

class AuthUpdateErrorState extends AuthState {
  final String message;
  AuthUpdateErrorState({required this.message});
}

class AuthDeleteSuccessState extends AuthState {
  final String message;

  AuthDeleteSuccessState({required this.message});
}

class AuthDeleteErrorState extends AuthState {
  final String message;

  AuthDeleteErrorState({required this.message});
}