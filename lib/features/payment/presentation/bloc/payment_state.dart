part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {}

class PaymentStateEmpty extends PaymentState {
  @override
  List<Object> get props => [];
}

class PaymentStateLoading extends PaymentState {
  @override
  List<Object> get props => [];
}

class PaymentStateError extends PaymentState {
  final String message;

  PaymentStateError(this.message);

  @override
  List<Object> get props => [message];
}

class PaymentStateLoadedAllPayment extends PaymentState {
  final List<Payment> payments;
  PaymentStateLoadedAllPayment(this.payments);
  @override
  List<Object> get props => [payments];
}

class PaymentStateLoadedPaymentByType extends PaymentState {
  final List<Payment> payments;
  PaymentStateLoadedPaymentByType(this.payments);
  @override
  List<Object> get props => [payments];
}

class PaymentStateLoadedPayment extends PaymentState {
  final Payment payment;
  PaymentStateLoadedPayment(this.payment);
  @override
  List<Object> get props => [payment];
}
