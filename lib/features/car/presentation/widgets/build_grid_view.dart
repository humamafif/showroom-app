import 'package:flutter/material.dart';
import 'package:showroom/core/constant/color.dart';
import 'package:showroom/core/utilities/image_brand.dart';
import 'package:showroom/core/utilities/torupiah.dart';
import 'package:showroom/features/car/domain/entities/car.dart';
import 'package:showroom/features/car/presentation/widgets/detail_car_modal/car_detail_modal.dart';

buildGridView(List<Car> cars, int carItemCount) {
  cars.sort((a, b) => b.price.compareTo(a.price));

  return GridView.builder(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 2,
    ),
    itemCount: carItemCount > 0 ? carItemCount : cars.length,
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          showCarDetailModal(context, cars[index]);
        },
        child: Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ShowroomColors.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: ShowroomColors.shadowColor,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Stack(
                  children: [
                    Image.network(
                      cars[index].imageURL,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: ShowroomColors.secondaryColor,
                            ),
                          );
                        } else {
                          return child;
                        }
                        // return const SizedBox.shrink();
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.broken_image,
                              size: double.infinity,
                              color: ShowroomColors.secondaryColor,
                            ),
                            Text(
                              'Failed to load image',
                              style: TextStyle(
                                  color: ShowroomColors.errorColor,
                                  fontSize: 8),
                            ),
                          ],
                        );
                      },
                    ),
                    Positioned(
                      top: 0,
                      right: 1,
                      child: Image.asset(
                        imageBrand(cars[index]),
                        height: 25,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              // price and name
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          cars[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          formatRupiah(cars[index].price),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: ShowroomColors.textPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
