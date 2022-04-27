// To parse this JSON data, do
//
//     final addIncomeResponseDto = addIncomeResponseDtoFromJson(jsonString);

import 'dart:convert';

AddIncomeResponseDto addIncomeResponseDtoFromJson(String str) => AddIncomeResponseDto.fromJson(json.decode(str));

String addIncomeResponseDtoToJson(AddIncomeResponseDto data) => json.encode(data.toJson());

class AddIncomeResponseDto {
  AddIncomeResponseDto({
    required this.amount,
    required this.comment,
    required  this.creditDate,
    required this.id,
    required this.incomeSourceResponse,
    required this.isConsiderAsHouseIncome,
    required  this.mode,
  });

  double amount;
  String comment;
  String creditDate;
  int id;
  IncomeSourceResponse incomeSourceResponse;
  bool isConsiderAsHouseIncome;
  String mode;

  factory AddIncomeResponseDto.fromJson(Map<String, dynamic> json) => AddIncomeResponseDto(
    amount: json["amount"],
    comment: json["comment"],
    creditDate: json["creditDate"],
    id: json["id"],
    incomeSourceResponse: IncomeSourceResponse.fromJson(json["incomeSourceResponse"]),
    isConsiderAsHouseIncome: json["isConsiderAsHouseIncome"],
    mode: json["mode"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "comment": comment,
    "creditDate": creditDate,
    "id": id,
    "incomeSourceResponse": incomeSourceResponse.toJson(),
    "isConsiderAsHouseIncome": isConsiderAsHouseIncome,
    "mode": mode,
  };
}

class IncomeSourceResponse {
  IncomeSourceResponse({
    required this.incomeSourceId,
    required this.incomeSourceName,
  });

  int incomeSourceId;
  String incomeSourceName;

  factory IncomeSourceResponse.fromJson(Map<String, dynamic> json) => IncomeSourceResponse(
    incomeSourceId: json["incomeSourceId"],
    incomeSourceName: json["incomeSourceName"],
  );

  Map<String, dynamic> toJson() => {
    "incomeSourceId": incomeSourceId,
    "incomeSourceName": incomeSourceName,
  };
}
