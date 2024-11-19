import 'package:flutter/material.dart';
import 'package:showroom/core/constant/color.dart';
import 'package:showroom/features/common/widgets/blue_line.dart';

class InitialTextWidget extends StatelessWidget {
  const InitialTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Auto Hub',
              style: TextStyle(
                color: ShowroomColors.textWhiteColor,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            BlueLineWidget(),
          ],
        ),
      ),
    );
  }
}
