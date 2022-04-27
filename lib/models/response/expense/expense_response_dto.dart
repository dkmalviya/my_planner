// To parse this JSON data, do
//
//     final expenseResponseDto = expenseResponseDtoFromJson(jsonString);

import 'dart:convert';

List<ExpenseResponseDto> expenseResponseDtoListFromJson(String str) => List<ExpenseResponseDto>.from(json.decode(str).map((x) => ExpenseResponseDto.fromJson(x)));

String expenseResponseDtoListToJson(List<ExpenseResponseDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


ExpenseResponseDto expenseResponseDtoFromJson(String str) =>
    ExpenseResponseDto.fromJson(json.decode(str));

String expenseResponseDtoToJson(ExpenseResponseDto data) =>
    json.encode(data.toJson());

class ExpenseResponseDto {
  ExpenseResponseDto({
    required this.amount,
    required this.createdBy,
    required this.createdById,
    required this.currency,
    required this.expenseCategoryName,
    required this.expenseDate,
    required this.expenseName,
    required this.expenseSubCategoryName,
    required this.expenseType,
    required this.id,
    required this.isHouseExpense,
    required this.mode,
  });

  double amount;
  String createdBy;
  int createdById;
  String currency;
  String expenseCategoryName;
  String expenseDate;
  String expenseName;
  String expenseSubCategoryName;
  String expenseType;
  int id;
  bool isHouseExpense;
  String mode;

  factory ExpenseResponseDto.fromJson(Map<String, dynamic> json) =>
      ExpenseResponseDto(
        amount: json["amount"],
        createdBy: json["createdBy"],
        createdById: json["createdById"],
        currency: json["currency"],
        expenseCategoryName: json["expenseCategoryName"],
        expenseDate: json["expenseDate"],
        expenseName: json["expenseName"],
        expenseSubCategoryName: json["expenseSubCategoryName"],
        expenseType: json["expenseType"],
        id: json["id"],
        isHouseExpense: json["isHouseExpense"],
        mode: json["mode"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "createdBy": createdBy,
        "createdById": createdById,
        "currency": currency,
        "expenseCategoryName": expenseCategoryName,
        "expenseDate": expenseDate,
        "expenseName": expenseName,
        "expenseSubCategoryName": expenseSubCategoryName,
        "expenseType": expenseType,
        "id": id,
        "isHouseExpense": isHouseExpense,
        "mode": mode,
      };

  @override
  String toString() {
    return 'ExpenseResponseDto{amount: $amount, createdBy: $createdBy, createdById: $createdById, currency: $currency, expenseCategoryName: $expenseCategoryName, expenseDate: $expenseDate, expenseName: $expenseName, expenseSubCategoryName: $expenseSubCategoryName, expenseType: $expenseType, id: $id, isHouseExpense: $isHouseExpense, mode: $mode}';
  }
}
