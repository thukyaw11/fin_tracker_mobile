class IncomeExpense {
  final double income;
  final double expense;

  IncomeExpense({required this.income, required this.expense});

  factory IncomeExpense.fromJson(Map<String, dynamic> json) {
    return IncomeExpense(
      income: json['income'].toDouble(),
      expense: json['expense'].toDouble(),
    );
  }
}
