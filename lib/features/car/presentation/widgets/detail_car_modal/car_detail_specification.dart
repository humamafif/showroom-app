import 'package:flutter/material.dart';
import 'package:showroom/core/utilities/torupiah.dart';
import 'package:showroom/features/car/domain/entities/car.dart';
import 'package:showroom/features/car/presentation/widgets/detail_car_modal/car_specification.dart';
import 'package:showroom/features/common/widgets/divider_custom.dart';

class CarSpecifications extends StatelessWidget {
  final Car car;

  const CarSpecifications({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DividerCustom(),
        SpecificationRow(label: "Price :", value: formatRupiah(car.price)),
        SpecificationRow(label: "Fuel :", value: car.fuelType),
        SpecificationRow(label: "Cabin Size :", value: car.cabinSize),
      ],
    );
  }
}
