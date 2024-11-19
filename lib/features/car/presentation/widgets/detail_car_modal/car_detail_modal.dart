import 'package:flutter/material.dart';
import 'package:showroom/core/constant/color.dart';
import 'package:showroom/features/car/domain/entities/car.dart';
import 'package:showroom/features/car/presentation/widgets/detail_car_modal/car_detail_content.dart';
import 'package:showroom/features/car/presentation/widgets/detail_car_modal/car_detail_header.dart';
import 'package:showroom/features/common/widgets/modal_handler.dart';

void showCarDetailModal(BuildContext context, Car car) {
  showModalBottomSheet(
    backgroundColor: ShowroomColors.backgroundColor,
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(35.0),
      ),
    ),
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 16.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(35.0),
            ),
            color: ShowroomColors.secondaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: ModalHandle()),
              const SizedBox(height: 16),
              const CarDetailHeader(),
              const SizedBox(height: 16),
              CarDetailContent(car: car),
            ],
          ),
        ),
      );
    },
  );
}
