class ReminderModel {
  int reminderId;
  String name;
  String occasion;
  bool isNotificationEnable;
  String occasionDate;

  ReminderModel(this.reminderId, this.name, this.occasion,
      this.isNotificationEnable, this.occasionDate);

  @override
  String toString() {
    return 'ReminderModel{reminderId: $reminderId, name: $name, occasion: $occasion, isNotificationEnable: $isNotificationEnable, occasionDate: $occasionDate}';
  }
}
