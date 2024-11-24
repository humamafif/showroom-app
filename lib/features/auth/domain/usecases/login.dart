import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/auth/domain/entities/user_entity.dart';
import 'package:showroom/features/auth/domain/repositories/auth_repo.dart';
import 'package:showroom/features/auth/domain/usecases/login_params.dart';

class Login {
  final AuthRepo repository;

  Login({required this.repository});

  Future<Either<Failure, UserEntity>> execute(LoginParams loginParams) async {
    return await repository.handleLogin(loginParams: loginParams);
  }
}
