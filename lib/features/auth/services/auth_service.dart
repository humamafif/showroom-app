import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:showroom/core/constant/api.dart';

class AuthService {
  final String apiUrl = '$BASE_URL/auth';
  Future<Map<String, dynamic>?> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$apiUrl/login"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Login Response: $responseData');

        if (responseData['message'] == 'user login') {
          return responseData['data'];
        }
      }
      return null;
    } catch (error) {
      throw Exception('Gagal terhubung ke server: $error');
    }
  }

  Future<Map<String, dynamic>?> register(
      String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      print('Register Response: ${response.body}');

      final responseData = json.decode(response.body);

      if (response.statusCode == 201) {
        if (responseData['message'] == 'user created') {
          print('Register Data: ${responseData['data']}');
          return responseData['data'];
        }
      }
      return null;
    } catch (error) {
      throw Exception('Gagal terhubung ke server: $error');
    }
  }

  Future<Map<String, dynamic>?> updateUsername(
      String id, String newUsername) async {
    try {
      final response = await http.put(
        Uri.parse('$apiUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': newUsername,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['message'] == 'user updated') {
          print('Update Data: ${responseData['data']}');
          return responseData['data'];
        }
      }
      return null;
    } catch (error) {
      throw Exception('Gagal terhubung ke server: $error');
    }
  }

  Future<bool> deleteUser(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$apiUrl/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['message'] == 'user deleted') {
          print('Delete Response: $responseData');
          return true;
        }
      }
      return false;
    } catch (error) {
      throw Exception('Gagal terhubung ke server: $error');
    }
  }
}
