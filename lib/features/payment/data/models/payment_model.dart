import 'package:showroom/features/payment/domain/entities/payment.dart';

class PaymentModel extends Payment {
  const PaymentModel(
      {required super.id, required super.name, required super.type});

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json["id"],
      name: json["name"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "type": type,
    };
  }

  static List<PaymentModel> fromJsonList(Map<String, dynamic> json) {
    final dataList = json["data"] as List<dynamic>?;
    if (dataList == null || dataList.isEmpty) return [];
    return dataList.map((e) => PaymentModel.fromJson(e)).toList();
  }
}
