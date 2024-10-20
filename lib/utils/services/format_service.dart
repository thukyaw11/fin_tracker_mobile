import 'package:intl/intl.dart';

class FormatService {
  static NumberFormat numberFormat = NumberFormat('#,##0');
}

// e.g => "${FormatService.numberFormat.format(// int here)} Ks"
