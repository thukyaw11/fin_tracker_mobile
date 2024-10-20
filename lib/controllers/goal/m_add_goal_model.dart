class AddGoalModel {
  final int amount;
  final String title;
  final int savedAmount;
  final String dueDate;

  AddGoalModel(
      {required this.title,
      required this.amount,
      required this.savedAmount,
      required this.dueDate});
}
