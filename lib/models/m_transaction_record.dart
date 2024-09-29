class Transaction {
  final String id;
  final int? amount;
  final String type;
  final CashCategory cashCategory;
  final String title;
  final String description;
  final DateTime createdAt;

  Transaction({
    required this.id,
    required this.amount,
    required this.type,
    required this.cashCategory,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      amount: json['amount'] ?? 0,
      type: json['type'],
      cashCategory: CashCategory.fromJson(json['cashCategory']),
      title: json['title'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  static List<Transaction> fromJsonList(List<dynamic> jsonList) {
    // loop the jsonList
    return jsonList.map((json) {
      return Transaction.fromJson(json);
    }).toList();
  }
}

class CashCategory {
  String id;
  String name;

  CashCategory({
    required this.id,
    required this.name,
  });

  factory CashCategory.fromJson(Map<String, dynamic> json) {
    return CashCategory(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
