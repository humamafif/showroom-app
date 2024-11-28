import 'package:showroom/features/car/domain/entities/car.dart';

class CarModel extends Car {
  const CarModel(
      {required super.id,
      required super.name,
      required super.brand,
      required super.fuelType,
      required super.cabinSize,
      required super.price,
      required super.imageURL});
// MAP => CarModel
  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json["id"],
      name: json["name"],
      brand: json["brand"],
      fuelType: json["fuel_type"],
      cabinSize: json["cabin_size"],
      price: json["price"],
      imageURL: json["image_url"],
    );
  }
// carModel => MAP
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "brand": brand,
      "fuel_type": fuelType,
      "cabin_size": cabinSize,
      "price": price,
      "image_url": imageURL,
    };
  }

  // List<Map> convert List<ProfileModel>
  static List<CarModel> fromJsonList(Map<String, dynamic> json) {
    final dataList =
        json["data"] as List<dynamic>?; // Ambil list dari key "data"
    if (dataList == null || dataList.isEmpty) return [];

    return dataList.map((e) => CarModel.fromJson(e)).toList();
  }
}
