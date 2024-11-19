import 'package:flutter/material.dart';
import 'package:showroom/core/constant/color.dart';
import 'package:showroom/core/utilities/image_brand.dart';
import 'package:showroom/features/car/domain/entities/car.dart';

class ImageCarouselGradient extends StatelessWidget {
  const ImageCarouselGradient({
    super.key,
    required this.car,
  });
  final Car car;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(car.imageURL),
          fit: BoxFit.fitWidth,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: ShowroomColors.secondaryColor,
                width: 1,
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.98),
                  Colors.black.withOpacity(0.25),
                  Colors.black.withOpacity(0),
                ],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        height: 40,
                        child: Image.asset(imageBrand(car))),
                    Text(
                      car.name,
                      style: const TextStyle(
                        color: ShowroomColors.textWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
