import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/payment/domain/entities/payment.dart';
import 'package:showroom/features/payment/domain/repositories/payment_repository.dart';

class GetAllPayment {
  final PaymentRepository repository;

  GetAllPayment({required this.repository});

  Future<Either<Failure, List<Payment>>> execute() async {
    return await repository.getAllPayment();
  }
}