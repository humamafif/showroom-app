import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:showroom/core/constant/url.dart';
import 'package:showroom/core/error/exception.dart';

import 'package:showroom/features/payment/data/models/payment_model.dart';

abstract class PaymentRemoteDatasource {
  Future<List<PaymentModel>> getAllPayment();
  Future<PaymentModel> getPaymentById(int id);
  Future<List<PaymentModel>> getPaymentByName(String name);
}

class PaymentRemoteDatasourceImpl extends PaymentRemoteDatasource {
  final http.Client client;
  String url = "$BASE_URL/payments";

  PaymentRemoteDatasourceImpl({required this.client});
  @override
  Future<PaymentModel> getPaymentById(int id) async {
    Uri uri = Uri.parse("$url/${id.toString()}");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> dataBody = jsonDecode(response.body);
      Map<String, dynamic> data = dataBody["data"];
      return PaymentModel.fromJson(data);
    } else if (response.statusCode == 404) {
      throw EmptyException(message: "Payment not found - Error 404");
    } else {
      throw GeneralException(message: "Cannot get data");
    }
  }

  @override
  Future<List<PaymentModel>> getPaymentByName(String name) async {
    Uri uri = Uri.parse("$url/type/$name");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> dataBody = jsonDecode(response.body);
      return PaymentModel.fromJsonList(dataBody);
    } else if (response.statusCode == 404) {
      throw EmptyException(message: "Payment not found - Error 404");
    } else {
      throw GeneralException(message: "Cannot get data");
    }
  }

  @override
  Future<List<PaymentModel>> getAllPayment() async {
    Uri url = Uri.parse(this.url);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> dataBody = jsonDecode(response.body);
      return PaymentModel.fromJsonList(dataBody);
    } else if (response.statusCode == 404) {
      throw EmptyException(message: "Payment not found - Error 404");
    } else {
      throw GeneralException(message: "Cannot get data");
    }
  }
}
