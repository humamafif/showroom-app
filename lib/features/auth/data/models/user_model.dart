import 'package:showroom/features/auth/domain/entities/user_entity.dart';

class UserModel extends User {
  const UserModel({
    required super.name,
    required super.username,
    required super.email,
    required super.phoneNumber,
    required super.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      username: json["username"],
      email: json["email"],
      phoneNumber: json["phone_number"],
      address: json["address"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "username": username,
      "email": email,
      "phone_number": phoneNumber,
      "address": address,
    };
  }
}
