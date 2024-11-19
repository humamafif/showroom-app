import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:showroom/features/car/domain/entities/car.dart';
import 'package:showroom/features/common/widgets/divider_custom.dart';
import 'package:showroom/features/payment/domain/entities/payment.dart';

class ListPaymentMethod extends StatelessWidget {
  const ListPaymentMethod({
    super.key,
    required this.payment,
    required this.car,
  });

  final List<Payment> payment;
  final Car car;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: payment.length,
      itemBuilder: (context, index) => Column(
        children: [
          InkWell(
            onTap: () => context.push('/orderdetail',
                extra: {"car": car, "paymentMethod": payment[index]}),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  payment[index].name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                ),
              ],
            ),
          ),
          const DividerCustom()
        ],
      ),
    );
  }
}
