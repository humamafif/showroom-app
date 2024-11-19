import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String username;
  final String email;
  final String phoneNumber;
  final String address;

  const User(
      {required this.name,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.address});

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        username,
        email,
        phoneNumber,
        address,
      ];
}
