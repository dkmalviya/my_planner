// To parse this JSON data, do
//
//     final genericResponseDto = genericResponseDtoFromJson(jsonString);

import 'dart:convert';

GenericResponseDto genericResponseDtoFromJson(String str) => GenericResponseDto.fromJson(json.decode(str));

String genericResponseDtoToJson(GenericResponseDto data) => json.encode(data.toJson());

class GenericResponseDto {
  GenericResponseDto({
    required this.responseCode,
    required this.status,
    required this.message,
  });

  int responseCode;
  String status;
  String message;

  factory GenericResponseDto.fromJson(Map<String, dynamic> json) => GenericResponseDto(
    responseCode: json["responseCode"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode,
    "status": status,
    "message": message,
  };
}
