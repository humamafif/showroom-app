import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/auth/domain/entities/user_entity.dart';
import 'package:showroom/features/auth/domain/repositories/user_repository.dart';
import 'package:showroom/features/auth/domain/usecases/register_params.dart';

class Register {
  final UserRepository repository;
  Register({required this.repository});
  Future<Either<Failure, User>> execute(RegisterParams registerParams) async {
    return await repository.register(registerParams: registerParams);
  }
}
