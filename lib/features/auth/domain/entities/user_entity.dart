import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String username;
  final String email;
  final String phoneNumber;
  final String address;

  const UserEntity(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.address});

  @override
  List<Object?> get props => [
        id,
        name,
        username,
        email,
        phoneNumber,
        address,
      ];
}
