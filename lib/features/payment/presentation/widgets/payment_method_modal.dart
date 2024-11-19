import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showroom/core/constant/color.dart';
import 'package:showroom/features/car/domain/entities/car.dart';
import 'package:showroom/features/common/widgets/loading.dart';
import 'package:showroom/features/payment/domain/entities/payment.dart';
import 'package:showroom/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:showroom/features/payment/presentation/widgets/payment_method_list.dart';

void showPaymentMethod(BuildContext context, Car car) {
  showModalBottomSheet(
    backgroundColor: ShowroomColors.secondaryColor,
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(35.0),
      ),
    ),
    builder: (context) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: ShowroomColors.accentBlack,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Choose a Payment Method",
                    style: TextStyle(
                      color: ShowroomColors.accentBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: ShowroomColors.backgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(35.0),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  children: [
                    BlocBuilder<PaymentBloc, PaymentState>(
                      builder: (context, state) {
                        if (state is PaymentStateLoading) {
                          return const Loading();
                        } else if (state is PaymentStateLoadedAllPayment) {
                          List<Payment> payment = state.payments.toList();
                          return ListPaymentMethod(
                            payment: payment,
                            car: car,
                          );
                        } else {
                          return const Center(
                            child: Text("Failed to load payment method"),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 300,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
