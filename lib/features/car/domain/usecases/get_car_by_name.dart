import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/car/domain/entities/car.dart';
import 'package:showroom/features/car/domain/repositories/car_repository.dart';

class GetCarByName {
  final CarRepository repository;

  GetCarByName({required this.repository});

  Future<Either<Failure, List<Car>>> execute(String name) async {
    return await repository.getCarByName(name);
  }
}
