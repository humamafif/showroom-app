import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:showroom/core/error/exception.dart';

import 'package:showroom/features/auth/data/models/user_model.dart';
import 'package:showroom/features/auth/domain/usecases/login_params.dart';
import 'package:showroom/features/auth/domain/usecases/register_params.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> login(LoginParams loginParams);
  Future<UserModel> register(RegisterParams registerParams);
  Future<void> logout();
}

class AuthRemoteDatasourceImp extends AuthRemoteDatasource {
  final http.Client client;
  final FlutterSecureStorage secureStorage;
  String url = "http://192.168.56.1:3030/users";

  AuthRemoteDatasourceImp({required this.client, required this.secureStorage});
  @override
  Future<UserModel> login(LoginParams loginParams) async {
    Uri uri = Uri.parse("$url/login");
    var response = await client.post(
      uri,
      body: json.encode({
        "username": loginParams.username,
        "password": loginParams.password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> dataBody = jsonDecode(response.body);
      await secureStorage.write(key: "token", value: dataBody["token"]);
      return UserModel.fromJson(dataBody);
    } else if (response.statusCode == 404) {
      throw EmptyException(message: "User not found");
    } else {
      throw GeneralException(message: "failed to login: ${response.body}");
    }
  }

  @override
  Future<UserModel> register(RegisterParams registerParams) async {
    Uri uri = Uri.parse("$url/register");
    var response = await client.post(
      uri,
      body: json.encode({
        "name": registerParams.name,
        "username": registerParams.username,
        "email": registerParams.email,
        "phone_number": registerParams.phoneNumber,
        "address": registerParams.address,
        "password": registerParams.password,
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> dataBody = json.decode(response.body);
      return UserModel.fromJson(dataBody);
    } else if (response.statusCode == 400) {
      throw GeneralException(message: "invalid input data");
    } else {
      throw ServerException(message: "Failed to register");
    }
  }

  @override
  Future<void> logout() async {
    await secureStorage.delete(key: 'token');
  }
}
