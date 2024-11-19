import 'package:intl/intl.dart';

String formatRupiah(dynamic price) {
  final formatCurrency = NumberFormat.currency(
    locale: 'id_ID',
    decimalDigits: 0,
  );

  if (price >= 1000000000) {
    double truncatedValue = price / 1000000000;
    return truncatedValue == truncatedValue.floor()
        ? 'IDR ${truncatedValue.toStringAsFixed(0)}B'
        : 'IDR ${truncatedValue.toStringAsFixed(1)}B';
  } else if (price >= 1000000) {
    double truncatedValue = price / 1000000;
    return truncatedValue == truncatedValue.floor()
        ? 'IDR ${truncatedValue.toStringAsFixed(0)}M'
        : 'IDR ${truncatedValue.toStringAsFixed(1)}M';
  } else if (price >= 1000) {
    double truncatedValue = price / 1000;
    return truncatedValue == truncatedValue.floor()
        ? 'IDR ${truncatedValue.toStringAsFixed(0)}K'
        : 'IDR ${truncatedValue.toStringAsFixed(1)}K';
  } else {
    return formatCurrency.format(price);
  }
}
