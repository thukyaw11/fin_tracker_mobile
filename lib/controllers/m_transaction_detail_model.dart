import 'package:get/get.dart';

class TransactionDetailModel {
  final String title;
  final String type;
  final String description;
  final int amount;
  final String transactionImageUrl;
  final bool isDeleted;
  final String cashCategory;
  final String walletTitle;
  final String id;

  TransactionDetailModel(
      {required this.title,
      required this.id,
      required this.cashCategory,
      required this.amount,
      required this.type,
      required this.description,
      required this.isDeleted,
      required this.transactionImageUrl,
      required this.walletTitle});

  factory TransactionDetailModel.fromJson(Map<String, dynamic> json) {
    return TransactionDetailModel(
        id: json["id"] ?? "",
        title: json["title"] ?? "",
        cashCategory: json["cashCategory"]["name"] ?? "",
        amount: json["amount"] ?? 0,
        type: json["type"] ?? "",
        description: json["description"] ?? "",
        isDeleted: json["isDeleted"] ?? false,
        transactionImageUrl: json["transactionImageUrl"] ?? "",
        walletTitle: json["wallet"]["walletTitle"] ?? "");
  }
}
