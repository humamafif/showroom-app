import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/auth/domain/entities/user_entity.dart';
import 'package:showroom/features/auth/domain/usecases/login_params.dart';
import 'package:showroom/features/auth/domain/usecases/register_params.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> handleLogin(
      {required LoginParams loginParams});
  Future<Either<Failure, UserEntity>> handleRegister(
      {required RegisterParams registerParams});
  Future<Either<Failure, UserEntity>> getUser(String id);

  Future<Either<Failure, void>> logout();
  Future<Either<Failure, bool>> isLogged();
}
