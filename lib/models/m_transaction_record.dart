class Transaction {
  String id;
  int amount;
  String type;
  CashCategory cashCategory;
  String title;
  String description;
  DateTime createdAt;

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
      amount: json['amount'],
      type: json['type'],
      cashCategory: CashCategory.fromJson(json['cashCategory']),
      title: json['title'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'type': type,
      'cashCategory': cashCategory.toJson(),
      'title': title,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
    };
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
