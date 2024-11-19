import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/car/domain/entities/car.dart';
import 'package:showroom/features/car/domain/repositories/car_repository.dart';

class GetAllCar {
  final CarRepository repository;

  GetAllCar({required this.repository});

  Future<Either<Failure, List<Car>>> execute() async {
    return await repository.getCars();
  }
}
