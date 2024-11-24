import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/auth/domain/repositories/auth_repo.dart';

class IsLogged {
  final AuthRepo repository;
  IsLogged({required this.repository});
  Future<Either<Failure, bool>> execute() async {
    return await repository.isLogged();
  }
}
