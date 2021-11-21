class ExpenseSummaryModel {
  int expenseId;
  String expenseName;
  String expenseCategory;
  String expenseSubCategory;
  String mode;
  String houseMember;
  int houseMemberId;
  double amount;
  String date;
  bool isHouseExpense;

  ExpenseSummaryModel(
      this.expenseId,
      this.expenseName,
      this.expenseCategory,
      this.expenseSubCategory,
      this.mode,
      this.houseMember,
      this.houseMemberId,
      this.amount,
      this.date,
      this.isHouseExpense);

  @override
  String toString() {
    return 'ExpenseSummaryModel{expenseId: $expenseId, expenseName: $expenseName, expenseCategory: $expenseCategory, expenseSubCategory: $expenseSubCategory, mode: $mode, houseMember: $houseMember, houseMemberId: $houseMemberId, amount: $amount, date: $date, isHouseExpense: $isHouseExpense}';
  }
}
