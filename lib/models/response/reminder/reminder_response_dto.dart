// To parse this JSON data, do
//
//     final reminderResponseDto = reminderResponseDtoFromJson(jsonString);

import 'dart:convert';

List<ReminderResponseDto> reminderResponseDtoFromJson(String str) => List<ReminderResponseDto>.from(json.decode(str).map((x) => ReminderResponseDto.fromJson(x)));

String reminderResponseDtoToJson(List<ReminderResponseDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReminderResponseDto {
  ReminderResponseDto({
    required this.notificationEnable,
    required  this.reminderDate,
    required this.reminderId,
    required this.reminderName,
    required this.reminderOccurrence,
    required this.reminderType,
  });

  bool notificationEnable;
  String reminderDate;
  int reminderId;
  String reminderName;
  String reminderOccurrence;
  String reminderType;

  factory ReminderResponseDto.fromJson(Map<String, dynamic> json) => ReminderResponseDto(
    notificationEnable: json["notificationEnable"],
    reminderDate: json["reminderDate"],
    reminderId: json["reminderId"],
    reminderName: json["reminderName"],
    reminderOccurrence: json["reminderOccurrence"],
    reminderType: json["reminderType"],
  );

  Map<String, dynamic> toJson() => {
    "notificationEnable": notificationEnable,
    "reminderDate": reminderDate,
    "reminderId": reminderId,
    "reminderName": reminderName,
    "reminderOccurrence": reminderOccurrence,
    "reminderType": reminderType,
  };
}
