import 'package:intl/intl.dart';

String formatNumber(int number) {
  final formatter = NumberFormat('#,###');
  return formatter.format(number);
}