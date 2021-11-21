class TodoModel {
  String activityName;
  DateTime dateTime;
  bool isCompleted;
  String priority;

  TodoModel(this.activityName, this.dateTime, this.isCompleted, this.priority);

  @override
  String toString() {
    return 'TodoModel{activityName: $activityName, dateTime: $dateTime, isCompleted: $isCompleted, priority: $priority}';
  }
}
