import 'package:flutter/material.dart';
import 'package:showroom/core/constant/color.dart';

class CarDetailHeader extends StatelessWidget {
  const CarDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Car Detail",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 3),
            width: 120,
            height: 5,
            decoration: BoxDecoration(
              color: ShowroomColors.accentBlack,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
