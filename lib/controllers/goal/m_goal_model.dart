import 'package:intl/intl.dart';
import 'c_goal.dart';

class GoalModel {
  final String id;
  final String title;
  final String deadLine;
  final String userId;
  final EnumGoalType status;
  final String createdAt;
  final int savedAmount;
  final int amount;

  GoalModel(
      {required this.title,
      required this.status,
      required this.createdAt,
      required this.deadLine,
      required this.id,
      required this.userId,
      required this.amount,
      required this.savedAmount});

  factory GoalModel.fromJson({required Map<String, dynamic> json}) {
    EnumGoalType temp = EnumGoalType.ongoing;
    switch (json["status"].toString().toUpperCase()) {
      case "ONGOING":
        temp = EnumGoalType.ongoing;
      case "ACHIEVED":
        temp = EnumGoalType.achieved;
      case "EXPIRED":
        temp = EnumGoalType.expired;
      default:
        temp = EnumGoalType.ongoing;
    }
    return GoalModel(
        title: json["title"] ?? "",
        status: temp,
        createdAt: convertToString(
            json["createdAt"] ?? DateTime.now().toIso8601String()),
        deadLine: convertToString(
            json["deadLine"] ?? DateTime.now().toIso8601String()),
        id: json["id"] ?? "",
        userId: json["userId"] ?? "",
        amount: json["amount"] ?? 0,
        savedAmount: json["savedAmount"] ?? 0);
  }

  static String convertToString(String isoDateString) {
    DateTime convertedDateTime =
        DateTime.tryParse(isoDateString) ?? DateTime.now();
    String convertedString =
        DateFormat('MMM dd, yyyy').format(convertedDateTime);
    return convertedString;
  }
}
