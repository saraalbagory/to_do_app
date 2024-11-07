import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String taskGroup;
  String taskName;
  String description;
  DateTime taskDate;
  String id;
  String status;

  TaskModel(
      {required this.taskGroup,
      required this.taskName,
      required this.description,
      required this.taskDate,
      required this.status,
      this.id=""});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            taskDate: (json['taskDate'] as Timestamp).toDate(),
            description: json['description'],
            taskName: json['taskName'],
           status: json['status'],
           taskGroup: json['taskGroup']);

  Map<String, dynamic> toJson() {
    return {
      'name': taskName,
      'details': description,
      'date': Timestamp.fromDate(taskDate),
      'status': status,
      'id': id,
      'taskGroup':taskGroup
    };
  }
}
