import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/core/storage/storage.dart';
import 'package:showroom/features/auth/domain/entities/user_entity.dart';
import 'package:showroom/features/auth/domain/repositories/auth_repo.dart';
import 'package:showroom/features/auth/domain/usecases/login.dart';
import 'package:showroom/features/auth/domain/usecases/login_params.dart';
import 'package:showroom/features/auth/domain/usecases/logout.dart';
import 'package:showroom/features/auth/domain/usecases/register.dart';
import 'package:showroom/features/auth/domain/usecases/register_params.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login _login;
  final Register _register;

  AuthBloc({
    required Login login,
    required Register register,
  })  : _register = register,
        _login = login,
        super(Unauthenticated()) {
    on<AppStarted>((event, emit) async {
      var token = await _getToken();
      if (token != "") {
        emit(Authenticated());
      } else {
        emit(Unauthenticated());
      }
    });
    on<LoggedInEvent>((event, emit) async {
      final username = event.username;
      final password = event.password;

      final user = await _login
          .execute(LoginParams(username: username, password: password));
      user.fold((failure) => print('error login: $failure'), (user) {
        emit(Authenticated());
      });
    });
    on<LoggedOut>(
      (event, emit) async {
        Storage().token = "";
        Storage().userID = "";
        await _deleteToken();
        await _deleterUserID();
        emit(Unauthenticated());
      },
    );
    on<RegisterEvent>(
      (event, emit) async {
        final registerParams = event.registerParams;
        final result = await _register.execute(registerParams);
        result.fold(
            (failure) => log("error: $failure"), (user) => log("user: $user"));
      },
    );
  }

  Future<void> _deleterUserID() async {
    await Storage().secureStorage.delete(key: "userID");
  }

  Future<void> _deleteToken() async {
    await Storage().secureStorage.delete(key: "token");
  }

  Future<void> _saveToken(String token) async {
    await Storage().secureStorage.write(key: "token", value: token);
  }

  Future<String?> _getToken() async {
    return await Storage().secureStorage.read(key: "token") ?? "";
  }
}
