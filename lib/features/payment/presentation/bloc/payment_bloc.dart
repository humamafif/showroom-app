import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/payment/domain/entities/payment.dart';
import 'package:showroom/features/payment/domain/usecases/get_all_payment.dart';
import 'package:showroom/features/payment/domain/usecases/get_payment_by_id.dart';
import 'package:showroom/features/payment/domain/usecases/get_payment_by_type.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final GetAllPayment getAllPayment;
  final GetPaymentById getPaymentById;
  final GetPaymentByType getPaymentByType;

  PaymentBloc(
      {required this.getAllPayment,
      required this.getPaymentById,
      required this.getPaymentByType})
      : super(PaymentStateEmpty()) {
    on<PaymentEventGetPayments>((event, emit) async {
      emit(PaymentStateLoading());
      Either<Failure, List<Payment>> resulGetAllPayment =
          await getAllPayment.execute();
      resulGetAllPayment.fold((failure) {
        emit(PaymentStateError("Cannot Get All Payment"));
      }, (payments) {
        emit(PaymentStateLoadedAllPayment(payments));
      });
    });

    on<PaymentEventGetPaymentById>((event, emit) async {
      emit(PaymentStateLoading());
      Either<Failure, Payment> resultGetPaymentById =
          await getPaymentById.execute(event.id);
      resultGetPaymentById.fold((failure) {
        emit(PaymentStateError("Cannot get payment by id"));
      }, (payment) {
        emit(PaymentStateLoadedPayment(payment));
      });
    });

    on<PaymentEventGetPaymentByType>((event, emit) async {
      emit(PaymentStateLoading());

      Either<Failure, List<Payment>> resultGetPaymentByType =
          await getPaymentByType.execute(event.type);
      resultGetPaymentByType.fold((failure) {
        emit(PaymentStateError("Cannot get payment by type"));
      }, (payments) {
        emit(PaymentStateLoadedPaymentByType(payments));
      });
    });
  }
}
