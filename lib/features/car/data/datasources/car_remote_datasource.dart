import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:showroom/core/error/exception.dart';
import 'package:showroom/features/car/data/models/car_model.dart';

abstract class CarRemoteDatasource {
  Future<List<CarModel>> getCars();
  Future<CarModel> getCarById(int id);
  Future<List<CarModel>> getCarByName(String name);
}

class CarRemoteDatasourceImplementation extends CarRemoteDatasource {
  final http.Client client;

  CarRemoteDatasourceImplementation({required this.client});
  // CarRemoteDatasourceImplementation();
  @override
  Future<List<CarModel>> getCars() async {
    Uri url = Uri.parse("http://192.168.56.1:3030/cars");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> dataBody = jsonDecode(response.body);
      return CarModel.fromJsonList(dataBody);
    } else if (response.statusCode == 404) {
      throw EmptyException(message: "Data not found - Error 404");
    } else {
      throw GeneralException(message: "Cannot get data");
    }
  }

  @override
  Future<CarModel> getCarById(int id) async {
    Uri uri = Uri.parse("http://192.168.56.1:3030/cars/${id.toString()}");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> dataBody = jsonDecode(response.body);
      Map<String, dynamic> data = dataBody["data"];
      return CarModel.fromJson(data);
    } else if (response.statusCode == 404) {
      throw EmptyException(message: "Data not found - Error 404");
    } else {
      throw GeneralException(message: "Cannot get data");
    }
  }

  @override
  Future<List<CarModel>> getCarByName(String name) async {
    Uri uri = Uri.parse("http://192.168.56.1:3030/cars/name/$name");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> dataBody = jsonDecode(response.body);
      return CarModel.fromJsonList(dataBody);
    } else if (response.statusCode == 404) {
      throw EmptyException(message: "Data not found - Error 404");
    } else {
      throw GeneralException(message: "Cannot get data");
    }
  }
}
