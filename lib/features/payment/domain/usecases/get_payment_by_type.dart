import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/payment/domain/entities/payment.dart';
import 'package:showroom/features/payment/domain/repositories/payment_repository.dart';

class GetPaymentByType {
  final PaymentRepository paymentRepository;

  GetPaymentByType({required this.paymentRepository});

  Future<Either<Failure, List<Payment>>> execute(String type) async {
    return await paymentRepository.getPaymentByType(type);
  }
}
