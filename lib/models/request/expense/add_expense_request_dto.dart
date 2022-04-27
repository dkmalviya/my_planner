class AddExpenseRequestDto{

  final double amount;
  final String expenseDate;
  final int expenseSubCategoryId;
  final bool isHouseExpense;
  final String expenseInvoice;
  final String expenseType;
  final String expenseName;
  final String mode;
  final String comment;


  AddExpenseRequestDto(this.amount, this.expenseDate, this.expenseSubCategoryId,
      this.isHouseExpense, this.expenseInvoice, this.expenseType,
      this.expenseName,this.mode,this.comment);

  AddExpenseRequestDto.fromJsonMap(Map<String, dynamic> map)
      : amount = map["amount"],
        expenseDate = map["expenseDate"],
        expenseSubCategoryId = map["expenseSubCategoryId"],
        isHouseExpense = map["isHouseExpense"],
        expenseInvoice = map["expenseInvoice"],
        expenseType = map["expenseType"],
        expenseName = map["expenseName"],
        mode = map["mode"],
        comment = map["comment"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['expenseDate'] = expenseDate;
    data['expenseSubCategoryId'] = expenseSubCategoryId;
    data['isHouseExpense'] = isHouseExpense;
    data['expenseInvoice'] = expenseInvoice;
    data['expenseType'] = expenseType;
    data['expenseName'] = expenseName;
    data['mode'] = mode;
    data['comment'] = comment;
    return data;
  }

}