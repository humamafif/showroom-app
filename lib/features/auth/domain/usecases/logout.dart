import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/auth/domain/repositories/auth_repo.dart';

class Logout {
  final AuthRepo repository;

  Logout(this.repository);

  Future<Either<Failure, void>> execute() async {
    return await repository.logout();
  }
}
