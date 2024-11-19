import 'package:flutter/material.dart';
import 'package:showroom/core/constant/color.dart';

class ModalHandle extends StatelessWidget {
  const ModalHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 5,
      decoration: BoxDecoration(
        color: ShowroomColors.accentBlack,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
