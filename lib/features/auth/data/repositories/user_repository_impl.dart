import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/core/storage/storage.dart';
import 'package:showroom/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:showroom/features/auth/domain/entities/user_entity.dart';
import 'package:showroom/features/auth/domain/repositories/auth_repo.dart';
import 'package:showroom/features/auth/domain/usecases/login_params.dart';
import 'package:showroom/features/auth/domain/usecases/register_params.dart';

class UserRepositoryImpl extends AuthRepo {
  final AuthRemoteDatasource authRemoteDatasource;

  UserRepositoryImpl({required this.authRemoteDatasource});
  @override
  Future<Either<Failure, UserEntity>> handleLogin(
      {required LoginParams loginParams}) async {
    try {
      UserEntity result = await authRemoteDatasource.handleLogin(loginParams);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> handleRegister(
      {required RegisterParams registerParams}) async {
    try {
      UserEntity result =
          await authRemoteDatasource.handleRegister(registerParams);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    // try {
    //   await authRemoteDatasource.logout();
    //   return const Right(null);
    // } catch (e) {
    //   return Left(ServerFailure(e.toString()));
    // }
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> isLogged() async {
    try {
      final token = await Storage().secureStorage.read(key: 'token');
      return token != null ? const Right(true) : const Right(false);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser(String id) async {
    try {
      final user = await authRemoteDatasource.getUser(id);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
