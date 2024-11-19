import 'package:showroom/features/car/domain/entities/car.dart';

String imageBrand(Car car) {
  if (car.brand == "AUDI") {
    return "assets/images/brand/audi.png";
  } else if (car.brand == "BMW") {
    return "assets/images/brand/bmw.png";
  } else if (car.brand == "Daihatsu") {
    return "assets/images/brand/daihatsu.png";
  } else if (car.brand == "Honda") {
    return "assets/images/brand/honda.png";
  } else if (car.brand == "MERCEDES") {
    return "assets/images/brand/mercedes.png";
  } else if (car.brand == "Mitsubishi") {
    return "assets/images/brand/mitsubishi.png";
  } else if (car.brand == "PORSCHE") {
    return "assets/images/brand/porsche.png";
  } else if (car.brand == "Toyota") {
    return "assets/images/brand/toyota.png";
  } else {
    return "";
  }
}
