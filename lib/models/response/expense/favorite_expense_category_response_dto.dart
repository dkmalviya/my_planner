// To parse this JSON data, do
//
//     final favoriteExpenseCategoryResponseDto = favoriteExpenseCategoryResponseDtoFromJson(jsonString);

import 'dart:convert';

List<FavoriteExpenseCategoryResponseDto> favoriteExpenseCategoryResponseDtoFromJson(String str) => List<FavoriteExpenseCategoryResponseDto>.from(json.decode(str).map((x) => FavoriteExpenseCategoryResponseDto.fromJson(x)));

String favoriteExpenseCategoryResponseDtoToJson(List<FavoriteExpenseCategoryResponseDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavoriteExpenseCategoryResponseDto {
  FavoriteExpenseCategoryResponseDto({
    required this.description,
    required this.expenseCategoryId,
    required this.expenseCategoryName,
    required this.expenseSubCategoryId,
    required this.expenseSubCategoryName,
    required this.favoriteId,
    required this.isDailyNeed,
  });

  String description;
  int expenseCategoryId;
  String expenseCategoryName;
  int expenseSubCategoryId;
  String expenseSubCategoryName;
  int favoriteId;
  bool isDailyNeed;

  factory FavoriteExpenseCategoryResponseDto.fromJson(Map<String, dynamic> json) => FavoriteExpenseCategoryResponseDto(
    description: json["description"],
    expenseCategoryId: json["expenseCategoryId"],
    expenseCategoryName: json["expenseCategoryName"],
    expenseSubCategoryId: json["expenseSubCategoryId"],
    expenseSubCategoryName: json["expenseSubCategoryName"],
    favoriteId: json["favoriteId"],
    isDailyNeed: json["isDailyNeed"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "expenseCategoryId": expenseCategoryId,
    "expenseCategoryName": expenseCategoryName,
    "expenseSubCategoryId": expenseSubCategoryId,
    "expenseSubCategoryName": expenseSubCategoryName,
    "favoriteId": favoriteId,
    "isDailyNeed": isDailyNeed,
  };
}
