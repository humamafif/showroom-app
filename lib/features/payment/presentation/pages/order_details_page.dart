import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:showroom/core/constant/color.dart';
import 'package:showroom/core/utilities/torupiah.dart';
import 'package:showroom/features/car/domain/entities/car.dart';
import 'package:showroom/features/common/widgets/alert_succes.dart';
import 'package:showroom/features/common/widgets/car_info_section.dart';
import 'package:showroom/features/common/widgets/divider_custom.dart';
import 'package:showroom/features/payment/domain/entities/payment.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage(
      {super.key, required this.car, required this.paymentMethod});
  final Car car;
  final Payment paymentMethod;

  @override
  Widget build(BuildContext context) {
    final double serviceCharge = car.price * 0.001;
    final double total = car.price + serviceCharge;
    return Scaffold(
      backgroundColor: ShowroomColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Order Details',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 28,
          ),
        ),
        backgroundColor: ShowroomColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CarInfoSection(car: car),
            const DividerCustom(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Price : ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  formatRupiah(car.price),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Services Charge : ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  formatRupiah(serviceCharge.toInt()),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  paymentMethod.name,
                  style: const TextStyle(
                      color: ShowroomColors.accentGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const DividerCustom(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total : ',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                ),
                Text(
                  formatRupiah(total.toInt()),
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 18),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: ShowroomColors.textWhiteColor,
                  backgroundColor: ShowroomColors.buttonPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        Future.delayed(const Duration(seconds: 2), () {
                          context.pop();
                          context.pop();
                          context.pop();
                          context.pop();
                          // context.pushReplacement("/");
                        });

                        return const AlertSucces();
                      });
                },
                child: const Text(
                  'Confirm',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
