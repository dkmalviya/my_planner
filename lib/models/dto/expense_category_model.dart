class ExpenseCategoryModel{
  int expenseCategoryId;
  String expenseCategoryName;

  ExpenseCategoryModel(this.expenseCategoryId, this.expenseCategoryName);

  @override
  String toString() {
    return 'ExpenseCategoryModel{expenseCategoryId: $expenseCategoryId, expenseCategoryName: $expenseCategoryName}';
  }
}