import 'package:flutter/material.dart';
import 'package:showroom/core/constant/color.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: ShowroomColors.secondaryColor,
      ),
    );
  }
}
