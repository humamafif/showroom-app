import 'package:http/http.dart' as http;

import 'package:showroom/features/payment/data/datasources/payment_remote_datasource.dart';

void main() async {
  // final CarRemoteDatasourceImplementation carRemoteDatasourceImplementation =
  //     CarRemoteDatasourceImplementation(client: http.Client());
  // var response = await carRemoteDatasourceImplementation.getCars();

  final PaymentRemoteDatasourceImpl remoteDatasourceImpl =
      PaymentRemoteDatasourceImpl(client: http.Client());

  try {
    // var carById = await carRemoteDatasourceImplementation.getCarById(300);
    // var carByName =
    //     await
    var payment = await remoteDatasourceImpl.getPaymentByName("va");

    // carRemoteDatasourceImplementation.getCarByName("dasdasdsa");
    // print("CAR ID: \n${carById.toJson()}");
    print("payment:");
    print(payment);
    // for (var car in carByName) {
    //   print(car.toJson());
    // }
  } catch (e) {
    print(e);
  }

  // for (var car in response) {
  //   print(car.toJson());
  // }
}
