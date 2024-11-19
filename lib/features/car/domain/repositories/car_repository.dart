import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/car/domain/entities/car.dart';

abstract class CarRepository {
  Future<Either<Failure, List<Car>>> getCars();
  Future<Either<Failure, List<Car>>> getCarByName(String name);
  Future<Either<Failure, Car>> getCarById(int id);
}
