	
class TaskRequestDto {

  bool completed;
  int priority;
  String taskDate;
  int taskId;
  String taskName;

	TaskRequestDto.fromJsonMap(Map<String, dynamic> map): 
		completed = map["completed"],
		priority = map["priority"],
		taskDate = map["taskDate"],
		taskId = map["taskId"],
		taskName = map["taskName"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['completed'] = completed;
		data['priority'] = priority;
		data['taskDate'] = taskDate;
		data['taskId'] = taskId;
		data['taskName'] = taskName;
		return data;
	}
}
