import 'package:flutter/material.dart';
import 'package:showroom/core/constant/size.dart';
import 'package:showroom/features/car/domain/entities/car.dart';

class CarInfoSection extends StatelessWidget {
  final Car car;

  const CarInfoSection({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: SizeConfig.screenWidth / 1.8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Image.network(
              car.imageURL,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                car.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                car.brand.toUpperCase(),
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
