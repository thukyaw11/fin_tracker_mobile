class AddSavingModel {
  final String goalId;
  final String savingDateInISOString;
  final int savingAmount;

  AddSavingModel(
      {required this.goalId,
      required this.savingAmount,
      required this.savingDateInISOString});
}
