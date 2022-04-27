class ExpenseSubCategoryModel {
  int expenseSubCategoryId;
  String expenseSubCategoryName;

  ExpenseSubCategoryModel(
      this.expenseSubCategoryId, this.expenseSubCategoryName);

  @override
  String toString() {
    return 'ExpenseSubCategoryModel{expenseSubCategoryId: $expenseSubCategoryId, expenseSubCategoryName: $expenseSubCategoryName}';
  }
}
