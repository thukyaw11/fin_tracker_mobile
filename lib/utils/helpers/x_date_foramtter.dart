import 'package:intl/intl.dart';

String xFullDateTimeFormat(DateTime rawDate) {
  String formatDate = DateFormat("EEEE d MMMM y  hh:mm a").format(rawDate);
  return formatDate;
}
