import 'package:flutter/material.dart';
import 'package:showroom/core/constant/color.dart';
import 'package:showroom/features/car/domain/entities/car.dart';
import 'package:showroom/features/car/presentation/widgets/detail_car_modal/car_detail_payment.dart';
import 'package:showroom/features/car/presentation/widgets/detail_car_modal/car_detail_specification.dart';
import 'package:showroom/features/common/widgets/car_info_section.dart';
import 'package:showroom/features/common/widgets/divider_custom.dart';

class CarDetailContent extends StatelessWidget {
  final Car car;

  const CarDetailContent({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(35.0),
        ),
        color: ShowroomColors.backgroundColor,
      ),
      child: Column(
        children: [
          CarInfoSection(car: car),
          const SizedBox(height: 16),
          CarSpecifications(car: car),
          const SizedBox(height: 24),
          const DividerCustom(),
          PaymentMethodSection(car: car),
        ],
      ),
    );
  }
}
