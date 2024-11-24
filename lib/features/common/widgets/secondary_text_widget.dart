import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:showroom/core/constant/color.dart';
import 'package:showroom/features/common/widgets/blue_line.dart';

class SecondaryTextWidget extends StatelessWidget {
  const SecondaryTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BlueLineWidget(),
            const SizedBox(height: 10),
            const Text(
              'Auto Hub',
              style: TextStyle(
                color: ShowroomColors.textWhiteColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Place for your dream car',
              style: TextStyle(
                color: ShowroomColors.secondaryColor,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.pushNamed("homepage");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ShowroomColors.buttonAccentRed,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Get Started   >',
                  style: TextStyle(
                    fontSize: 16,
                    color: ShowroomColors.textWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
