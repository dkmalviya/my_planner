import 'dart:convert';

List<IncomeSourceResponseDto> incomeSourceResponseDtoFromJson(String str) => List<IncomeSourceResponseDto>.from(json.decode(str).map((x) => IncomeSourceResponseDto.fromJson(x)));

String incomeSourceResponseDtoToJson(List<IncomeSourceResponseDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IncomeSourceResponseDto {
  IncomeSourceResponseDto({
    required this.incomeSourceId,
    required this.incomeSourceName,
  });

  int incomeSourceId;
  String incomeSourceName;

  factory IncomeSourceResponseDto.fromJson(Map<String, dynamic> json) => IncomeSourceResponseDto(
    incomeSourceId: json["incomeSourceId"],
    incomeSourceName: json["incomeSourceName"],
  );

  Map<String, dynamic> toJson() => {
    "incomeSourceId": incomeSourceId,
    "incomeSourceName": incomeSourceName,
  };
}
