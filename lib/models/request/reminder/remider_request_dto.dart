class ReminderRequestDto {
  final bool notificationEnable;
  final String reminderDate;
  final int reminderId;
  final String reminderName;
  final String reminderOccurrence;
  final String reminderType;


  ReminderRequestDto(
      this.notificationEnable,
      this.reminderDate,
      this.reminderId,
      this.reminderName,
      this.reminderOccurrence,
      this.reminderType,
    );

  ReminderRequestDto.fromJsonMap(Map<String, dynamic> map)
      : notificationEnable = map["notificationEnable"],
        reminderDate = map["reminderDate"],
        reminderId = map["reminderId"],
        reminderName = map["reminderName"],
        reminderOccurrence = map["reminderOccurrence"],
        reminderType = map["reminderType"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notificationEnable'] = notificationEnable;
    data['reminderDate'] = reminderDate;
    data['reminderId'] = reminderId;
    data['reminderName'] = reminderName;
    data['reminderOccurrence'] = reminderOccurrence;
    data['reminderType'] = reminderType;

    return data;
  }
}
