import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:showroom/features/auth/domain/entities/user_entity.dart';
import 'package:showroom/features/auth/domain/repositories/user_repository.dart';
import 'package:showroom/features/auth/domain/usecases/login_params.dart';
import 'package:showroom/features/auth/domain/usecases/register_params.dart';

class UserRepositoryImpl extends UserRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  UserRepositoryImpl({required this.authRemoteDatasource});
  @override
  Future<Either<Failure, User>> login(
      {required LoginParams loginParams}) async {
    try {
      User result = await authRemoteDatasource.login(loginParams);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> register(
      {required RegisterParams registerParams}) async {
    try {
      User result = await authRemoteDatasource.register(registerParams);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await authRemoteDatasource.logout();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
