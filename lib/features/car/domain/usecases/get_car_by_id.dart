import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/car/domain/entities/car.dart';
import 'package:showroom/features/car/domain/repositories/car_repository.dart';

class GetCarById {
  final CarRepository repository;

  GetCarById({required this.repository});

  Future<Either<Failure, Car>> execute(int id) async {
    return repository.getCarById(id);
  }
}
