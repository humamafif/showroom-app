import 'package:showroom/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.phoneNumber,
    required super.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user']['id'] ?? "",
      name: json['user']['name'] ?? "",
      username: json['user']['username'] ?? "",
      email: json['user']['email'] ?? "",
      phoneNumber: json['user']['phone_number'] ?? "",
      address: json['user']['address'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "username": username,
      "email": email,
      "phone_number": phoneNumber,
      "address": address,
    };
  }
}
