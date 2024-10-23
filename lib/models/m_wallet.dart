import 'package:expense_tracker_mobile/utils/helpers/logger.dart';

class Wallet {
  final String id;
  final String imageUrl;
  final String walletTitle;
  final int walletAmount;
  final String walletDescription;
  final DateTime createdAt;

  @override
  String toString() {
    return 'Wallet{id: $id, imageUrl: $imageUrl, walletTitle: $walletTitle, walletDescription: $walletDescription, createdAt: $createdAt}';
  }

  Wallet(
      {required this.id,
      required this.imageUrl,
      required this.walletTitle,
      required this.walletDescription,
      required this.walletAmount,
      required this.createdAt});

  factory Wallet.fromJson(Map<String, dynamic> json) {
    DateTime formattedDate = DateTime(0);
    formattedDate = DateTime.parse(json["createdAt"])
        .add(const Duration(hours: 6, minutes: 30));
    return Wallet(
        id: json['id'],
        imageUrl: json['imageUrl'],
        walletTitle: json['walletTitle'],
        walletDescription: json['walletDescription'],
        walletAmount: json['walletAmount'],
        createdAt: formattedDate);
  }

  static List<Wallet> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Wallet.fromJson(json)).toList();
  }
}
