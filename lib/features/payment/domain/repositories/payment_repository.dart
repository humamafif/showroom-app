import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/payment/domain/entities/payment.dart';

abstract class PaymentRepository {
  Future<Either<Failure, List<Payment>>> getAllPayment();
  Future<Either<Failure, List<Payment>>> getPaymentByType(String name);
  
  Future<Either<Failure, Payment>> getPaymentById(int id);
}