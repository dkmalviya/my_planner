class AddIncomeRequestDto {
  final double amount;
  final String creditDate;
  final int incomeSourceId;
  final String incomeSourceName;
  final bool isConsiderAsHouseIncome;
  final String mode;
  final String comment;


  AddIncomeRequestDto(this.amount, this.creditDate, this.incomeSourceId,
      this.incomeSourceName, this.isConsiderAsHouseIncome, this.mode,
      this.comment);

  AddIncomeRequestDto.fromJsonMap(Map<String, dynamic> map)
      : amount = map["amount"],
        creditDate = map["creditDate"],
        incomeSourceId = map["incomeSourceId"],
        incomeSourceName = map["incomeSourceName"],
        isConsiderAsHouseIncome = map["isConsiderAsHouseIncome"],
        comment = map["comment"],
        mode = map["mode"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['creditDate'] = creditDate;
    data['incomeSourceId'] = incomeSourceId;
    data['incomeSourceName'] = incomeSourceName;
    data['isConsiderAsHouseIncome'] = isConsiderAsHouseIncome;
    data['comment'] = comment;
    data['mode'] = mode;

    return data;
  }
}
