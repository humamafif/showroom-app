import 'package:flutter/material.dart';
import 'package:showroom/core/constant/color.dart';

class BlueLineWidget extends StatelessWidget {
  const BlueLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 158,
      color: ShowroomColors.accentBlue,
    );
  }
}
