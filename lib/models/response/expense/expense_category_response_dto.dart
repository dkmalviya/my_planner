// To parse this JSON data, do
//
//     final expenseCategoryResponseDto = expenseCategoryResponseDtoFromJson(jsonString);

import 'dart:convert';

List<ExpenseCategoryResponseDto> expenseCategoryResponseDtoFromJson(
        String str) =>
    List<ExpenseCategoryResponseDto>.from(
        json.decode(str).map((x) => ExpenseCategoryResponseDto.fromJson(x)));

String expenseCategoryResponseDtoToJson(
        List<ExpenseCategoryResponseDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExpenseCategoryResponseDto {
  ExpenseCategoryResponseDto({
    required this.description,
    required this.expenseCategoryId,
    required this.expenseCategoryName,
  });

  String description;
  int expenseCategoryId;
  String expenseCategoryName;

  factory ExpenseCategoryResponseDto.fromJson(Map<String, dynamic> json) =>
      ExpenseCategoryResponseDto(
        description: json["description"],
        expenseCategoryId: json["expenseCategoryId"],
        expenseCategoryName: json["expenseCategoryName"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "expenseCategoryId": expenseCategoryId,
        "expenseCategoryName": expenseCategoryName,
      };
}
