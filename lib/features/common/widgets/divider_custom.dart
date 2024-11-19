import 'package:flutter/material.dart';
import 'package:showroom/core/constant/color.dart';

class DividerCustom extends StatelessWidget {
  const DividerCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: ShowroomColors.secondaryColor,
      thickness: 2,
    );
  }
}
