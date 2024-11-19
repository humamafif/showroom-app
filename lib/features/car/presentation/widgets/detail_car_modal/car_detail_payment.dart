import 'package:flutter/material.dart';
import 'package:showroom/core/constant/color.dart';
import 'package:showroom/features/car/domain/entities/car.dart';
import 'package:showroom/features/payment/presentation/widgets/payment_method_modal.dart';

class PaymentMethodSection extends StatelessWidget {
  final Car car;

  const PaymentMethodSection({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(
          flex: 4,
          fit: FlexFit.tight,
          child: Text(
            "Metode Pembayaran",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: ElevatedButton(
            onPressed: () {
              showPaymentMethod(context, car);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.only(left: 10),
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: ShowroomColors.secondaryColor,
            ),
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: ShowroomColors.accentBlack,
            ),
          ),
        ),
      ],
    );
  }
}
