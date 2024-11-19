import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/auth/domain/entities/user_entity.dart';
import 'package:showroom/features/auth/domain/repositories/user_repository.dart';
import 'package:showroom/features/auth/domain/usecases/login_params.dart';

class Login {
  final UserRepository repository;

  Login({required this.repository});

  Future<Either<Failure, User>> execute(LoginParams loginParams) async {
    return await repository.login(loginParams: loginParams);
  }
}
