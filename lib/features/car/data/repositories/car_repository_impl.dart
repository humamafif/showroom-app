import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/car/data/datasources/car_remote_datasource.dart';
import 'package:showroom/features/car/data/models/car_model.dart';
import 'package:showroom/features/car/domain/entities/car.dart';
import 'package:showroom/features/car/domain/repositories/car_repository.dart';

class CarRepositoryImpl extends CarRepository {
  final CarRemoteDatasource carRemoteDatasource;

  CarRepositoryImpl({
    required this.carRemoteDatasource,
  });

  @override
  Future<Either<Failure, List<Car>>> getCars() async {
    try {
      // ambil data dari remote
      List<CarModel> result = await carRemoteDatasource.getCars();
      // Put data to local
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Car>> getCarById(int id) async {
    try {
      CarModel result = await carRemoteDatasource.getCarById(id);

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Car>>> getCarByName(String name) async {
    try {
      List<CarModel> result = await carRemoteDatasource.getCarByName(name);

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
