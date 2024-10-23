import 'package:expense_tracker_mobile/controllers/alert/c_alert.dart';
import 'package:intl/intl.dart';

class AlertModel {
  final String id;
  final String title;
  final String content;
  final EnumAlertType type;
  final String createdAt;

  AlertModel({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.createdAt,
  });

  factory AlertModel.fromJson({required Map<String, dynamic> json}) {
    EnumAlertType temp = EnumAlertType.warning;
    switch (json["status"].toString().toUpperCase()) {
      case "WARNING":
        temp = EnumAlertType.warning;
      case "NOTI":
        temp = EnumAlertType.noti;
      case "INFO":
        temp = EnumAlertType.info;
      default:
        temp = EnumAlertType.warning;
    }
    return AlertModel(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      content: json["content"] ?? "",
      type: temp,
      createdAt: convertToString(
          json["createdAt"] ?? DateTime.now().toIso8601String()),
    );
  }

  static String convertToString(String isoDateString) {
    DateTime convertedDateTime =
        DateTime.tryParse(isoDateString) ?? DateTime.now();
    String convertedString =
        DateFormat('MMM dd, yyyy').format(convertedDateTime);
    return convertedString;
  }
}
