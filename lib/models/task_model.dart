class TaskModel {
  String taskGroup;
  String taskName;
  String description;
  DateTime taskDate;
  String status;

  TaskModel(
      {required this.taskGroup,
      required this.taskName,
      required this.description,
      required this.taskDate,
      required this.status});
}
