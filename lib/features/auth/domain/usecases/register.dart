import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/auth/domain/entities/user_entity.dart';
import 'package:showroom/features/auth/domain/repositories/auth_repo.dart';
import 'package:showroom/features/auth/domain/usecases/register_params.dart';

class Register {
  final AuthRepo repository;
  Register({required this.repository});
  Future<Either<Failure, UserEntity>> execute(
      RegisterParams registerParams) async {
    return await repository.handleRegister(registerParams: registerParams);
  }
}
