part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {}

class PaymentEventGetPayments extends PaymentEvent {
  @override
  List<Object?> get props => [];
}

class PaymentEventGetPaymentById extends PaymentEvent {
  final int id;

  PaymentEventGetPaymentById({required this.id});

  @override
  List<Object?> get props => [id];
}

class PaymentEventGetPaymentByType extends PaymentEvent {
  final String type;

  PaymentEventGetPaymentByType({required this.type});

  @override
  List<Object?> get props => [type];
}
