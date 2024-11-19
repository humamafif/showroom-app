import 'package:hive/hive.dart';
import 'package:showroom/features/car/data/models/car_model.dart';

abstract class CarLocalDatasource {
  Future<List<CarModel>> getCars();
  Future<List<CarModel>> getCarByName(String name);
  Future<CarModel> getCarById(int id);
}

class CarLocalDatasourceImplementation extends CarLocalDatasource {
  final Box box;

  CarLocalDatasourceImplementation({required this.box});
  @override
  Future<List<CarModel>> getCars() async {
    return box.get("cars");
  }

  @override
  Future<CarModel> getCarById(int id) async {
    return box.get("getCarById");
  }

  @override
  Future<List<CarModel>> getCarByName(String name) async {
    return box.get("getCarByName");
  }
}
