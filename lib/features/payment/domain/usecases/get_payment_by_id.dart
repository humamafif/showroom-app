import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/payment/domain/entities/payment.dart';
import 'package:showroom/features/payment/domain/repositories/payment_repository.dart';

class GetPaymentById {
  final PaymentRepository paymentRepository;

  GetPaymentById({required this.paymentRepository});

  Future<Either<Failure, Payment>> execute(int id) async {
    return await paymentRepository.getPaymentById(id);
  }
}
