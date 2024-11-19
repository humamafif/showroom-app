import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/car/data/datasources/car_local_datasource.dart';
import 'package:showroom/features/car/data/datasources/car_remote_datasource.dart';
import 'package:showroom/features/car/data/models/car_model.dart';
import 'package:showroom/features/car/domain/entities/car.dart';
import 'package:showroom/features/car/domain/repositories/car_repository.dart';

class CarRepositoryImpl extends CarRepository {
  final CarRemoteDatasource carRemoteDatasource;
  final CarLocalDatasource carLocalDatasource;
  final Box box;

  CarRepositoryImpl({
    required this.carRemoteDatasource,
    required this.carLocalDatasource,
    required this.box,
  });

  @override
  Future<Either<Failure, List<Car>>> getCars() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        // ambil data dari local
        List<CarModel> result = await carLocalDatasource.getCars();
        return Right(result);
      } else {
        // ambil data dari remote
        List<CarModel> result = await carRemoteDatasource.getCars();
        // Put data to local
        box.put("cars", result);
        return Right(result);
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Car>> getCarById(int id) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        CarModel result = await carLocalDatasource.getCarById(id);
        return Right(result);
      } else {
        CarModel result = await carRemoteDatasource.getCarById(id);
        box.put("getCarById", result);
        return Right(result);
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Car>>> getCarByName(String name) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        List<CarModel> result = await carLocalDatasource.getCarByName(name);
        return Right(result);
      } else {
        List<CarModel> result = await carRemoteDatasource.getCarByName(name);
        box.put("getCarByName", result);
        return Right(result);
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
