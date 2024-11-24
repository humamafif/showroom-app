import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/auth/domain/entities/user_entity.dart';
import 'package:showroom/features/auth/domain/repositories/auth_repo.dart';

class GetUser {
  final AuthRepo repository;
  GetUser({required this.repository});
  Future<Either<Failure, UserEntity>> execute(String id) async {
    return await repository.getUser(id);
  }
}
