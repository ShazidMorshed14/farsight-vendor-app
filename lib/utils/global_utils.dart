// lib/utils/currency_utils.dart
import 'package:get/get.dart';
import 'package:intl/intl.dart';

String formatCurrencyInComma(double amount) {
  final formatter = NumberFormat('#,##0', 'en_US'); // Define format
  return formatter.format(amount);
}

String formatCurrencyToTwoDecimal(double amount) {
  String formattedValue = amount.toStringAsFixed(2);
  return formattedValue;
}
