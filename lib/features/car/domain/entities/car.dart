import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 0)
class Car extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int price;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String brand;
  @HiveField(4)
  final String fuelType;
  @HiveField(5)
  final String cabinSize;
  @HiveField(6)
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
