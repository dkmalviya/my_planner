// To parse this JSON data, do
//
//     final expenseSubCategoryResponseDto = expenseSubCategoryResponseDtoFromJson(jsonString);

import 'dart:convert';

ExpenseSubCategoryResponseDto expenseSubCategoryResponseDtoFromJson(String str) => ExpenseSubCategoryResponseDto.fromJson(json.decode(str));

String expenseSubCategoryResponseDtoToJson(ExpenseSubCategoryResponseDto data) => json.encode(data.toJson());

class ExpenseSubCategoryResponseDto {
  ExpenseSubCategoryResponseDto({
    required this.description,
    required this.expenseCategoryId,
    required this.expenseCategoryName,
    required this.expenseSubCategoryDtoList,
  });

  String description;
  int expenseCategoryId;
  String expenseCategoryName;
  List<ExpenseSubCategoryDtoList> expenseSubCategoryDtoList;

  factory ExpenseSubCategoryResponseDto.fromJson(Map<String, dynamic> json) => ExpenseSubCategoryResponseDto(
    description: json["description"],
    expenseCategoryId: json["expenseCategoryId"],
    expenseCategoryName: json["expenseCategoryName"],
    expenseSubCategoryDtoList: List<ExpenseSubCategoryDtoList>.from(json["expenseSubCategoryDtoList"].map((x) => ExpenseSubCategoryDtoList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "expenseCategoryId": expenseCategoryId,
    "expenseCategoryName": expenseCategoryName,
    "expenseSubCategoryDtoList": List<dynamic>.from(expenseSubCategoryDtoList.map((x) => x.toJson())),
  };
}

class ExpenseSubCategoryDtoList {
  ExpenseSubCategoryDtoList({
    required this.description,
    required this.expenseSubCategoryId,
    required this.expenseSubCategoryName,
  });

  String description;
  int expenseSubCategoryId;
  String expenseSubCategoryName;

  factory ExpenseSubCategoryDtoList.fromJson(Map<String, dynamic> json) => ExpenseSubCategoryDtoList(
    description: json["description"],
    expenseSubCategoryId: json["expenseSubCategoryId"],
    expenseSubCategoryName: json["expenseSubCategoryName"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "expenseSubCategoryId": expenseSubCategoryId,
    "expenseSubCategoryName": expenseSubCategoryName,
  };
}
