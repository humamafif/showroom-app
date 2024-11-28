import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:showroom/core/constant/api.dart';
import 'package:showroom/core/error/exception.dart';
import 'package:showroom/core/storage/storage.dart';
import 'package:showroom/features/auth/data/models/user_model.dart';
import 'package:showroom/features/auth/domain/usecases/login_params.dart';
import 'package:showroom/features/auth/domain/usecases/register_params.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> handleLogin(LoginParams loginParams);
  Future<UserModel> handleRegister(RegisterParams registerParams);
  Future<UserModel> getUser(String id);
  Future<void> logout();
  Future<void> saveID(String id);
}

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  final http.Client client;
  String url = "$BASE_URL/users";

  AuthRemoteDatasourceImpl({required this.client});
  @override
  Future<UserModel> handleLogin(LoginParams loginParams) async {
    Uri uri = Uri.parse("$url/login");
    log("Sending login request to $uri with username: ${loginParams.username}");
    var response = await client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "username": loginParams.username,
        "password": loginParams.password,
      }),
    );
    log("Login response status: ${response.statusCode}");
    log("Login response body: ${response.body}");

    if (response.statusCode == 200) {
      Map<String, dynamic> dataBody = jsonDecode(response.body);
      await Storage()
          .secureStorage
          .write(key: "token", value: dataBody["token"]);

      await saveID(dataBody['id']);

      return UserModel.fromJson(dataBody);
    } else if (response.statusCode == 404) {
      throw EmptyException(message: "User not found");
    } else {
      throw GeneralException(message: "failed to login: ${response.body}");
    }
  }

  @override
  Future<UserModel> handleRegister(RegisterParams registerParams) async {
    Uri uri = Uri.parse("$url/register");
    log("Sending register request to $uri with username: ${registerParams.username}");
    var response = await client.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "name": registerParams.name,
        "username": registerParams.username,
        "email": registerParams.email,
        "phone_number": registerParams.phoneNumber,
        "address": registerParams.address,
        "password": registerParams.password,
      }),
    );
    log("Register response status: ${response.statusCode}");
    log("Register response body: ${response.body}");

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
    final token = await Storage().secureStorage.read(key: 'token');
    log("Deleting token: $token");
    await Storage().secureStorage.delete(key: 'token');
  }

  @override
  Future<UserModel> getUser(String id) async {
    Uri uri = Uri.parse("$url/$id");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> dataBody = jsonDecode(response.body);
      Map<String, dynamic> data = dataBody['data'];
      return UserModel.fromJson(data);
    } else if (response.statusCode == 404) {
      throw EmptyException(message: "User not found");
    } else {
      throw GeneralException(message: "Cannot get data");
    }
  }

  @override
  Future<void> saveID(String id) async {
    try {
      await Storage().secureStorage.write(key: 'userID', value: id);
    } catch (e) {
      throw GeneralException(message: "Failed to save ID: $e");
    }
  }
}
