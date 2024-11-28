import 'package:equatable/equatable.dart';

class Car extends Equatable {

  final int id;

  final int price;

  final String name;

  final String brand;

  final String fuelType;

  final String cabinSize;

  final String imageURL;

  const Car(
      {required this.id,
      required this.name,
      required this.brand,
      required this.fuelType,
      required this.cabinSize,
      required this.price,
      required this.imageURL});

  @override
  List<Object?> get props => [
        id,
        name,
        brand,
        fuelType,
        cabinSize,
        price,
        imageURL,
      ];
}
