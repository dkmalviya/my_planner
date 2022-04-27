class ExpenseSummaryModel {
  int expenseId;
  String expenseName;
  String expenseCategory;
  String expenseSubCategory;
  String mode;
  String houseMemberName;
  int houseMemberUserId;
  double amount;
  String date;
  bool isHouseExpense;

  ExpenseSummaryModel(
      this.expenseId,
      this.expenseName,
      this.expenseCategory,
      this.expenseSubCategory,
      this.mode,
      this.houseMemberName,
      this.houseMemberUserId,
      this.amount,
      this.date,
      this.isHouseExpense);

  @override
  String toString() {
    return 'ExpenseSummaryModel{expenseId: $expenseId, expenseName: $expenseName, expenseCategory: $expenseCategory, expenseSubCategory: $expenseSubCategory, mode: $mode, houseMemberName: $houseMemberName, houseMemberUserId: $houseMemberUserId, amount: $amount, date: $date, isHouseExpense: $isHouseExpense}';
  }
}
