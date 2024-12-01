import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showroom/features/auth/services/auth_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc({required this.authService}) : super(AuthInitialState()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final response =
            await authService.login(event.username, event.password);

        if (response != null) {
          emit(AuthAuthenticatedState(
            username: response['username'],
            id: response['id'].toString(),
          ));
          print("Auth State");
        } else {
          emit(AuthErrorState(message: 'Invalid username or password.'));
        }
      } catch (e) {
        emit(AuthErrorState(message: 'Login failed: $e'));
      }
    });

    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthLoadingState());

      try {
        final response =
            await authService.register(event.username, event.password);

        if (response != null) {
          emit(AuthRegisteredState(message: 'Registration Successful!'));
        } else {
          emit(AuthErrorState(message: 'Registration Failed.'));
        }
      } catch (e) {
        emit(AuthErrorState(message: 'Registration failed: $e'));
      }
    });

    on<AuthLogoutEvent>((event, emit) {
      emit(AuthUnauthenticatedState());
    });

    on<AuthUpdateUserEvent>((event, emit) async {
      print("===== UPDATE USER EVENT =====");
      emit(AuthLoadingState());
      print("Loading State");

      try {
        final response =
            await authService.updateUsername(event.id, event.newUsername);

        if (response != null) {
          emit(AuthUpdateSuccessState(
              message: 'Username updated successfully!'));
          print("Update succes State");
          emit(AuthAuthenticatedState(
            username: response['username'],
            id: response['id'].toString(),
          ));
          print("auth State");
        } else {
          emit(AuthUpdateErrorState(message: 'Failed to update username.'));
          print("Error State");
        }
      } catch (e) {
        emit(AuthUpdateErrorState(message: 'Update failed: $e'));
        print("Error Failed State");
      }
      print("===== UPDATE USER EVENT END =====");
    });
  }
}
