import 'package:dartz/dartz.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/payment/data/datasources/payment_remote_datasource.dart';
import 'package:showroom/features/payment/domain/entities/payment.dart';
import 'package:showroom/features/payment/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl extends PaymentRepository {
  final PaymentRemoteDatasource paymentRemoteDatasource;

  PaymentRepositoryImpl({required this.paymentRemoteDatasource});
  @override
  Future<Either<Failure, List<Payment>>> getAllPayment() async {
    try {
      List<Payment> result = await paymentRemoteDatasource.getAllPayment();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Payment>> getPaymentById(int id) async {
    try {
      Payment result = await paymentRemoteDatasource.getPaymentById(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Payment>>> getPaymentByType(String name) async {
    try {
      List<Payment> result =
          await paymentRemoteDatasource.getPaymentByName(name);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
