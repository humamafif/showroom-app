import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/auth/domain/entities/user_entity.dart';
import 'package:showroom/features/auth/domain/usecases/login_params.dart';
import 'package:showroom/features/auth/domain/usecases/register_params.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> register(
      {required RegisterParams registerParams});
  Future<Either<Failure, User>> login({required LoginParams loginParams});
  Future<Either<Failure, void>> logout();
}
