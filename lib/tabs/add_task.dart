import 'package:flutter/material.dart';
import 'package:to_do_app/common/images_name.dart';
import 'package:to_do_app/common/task_groups_icons.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var _selectedValue="work";
  final List<String> taskGroup = [
    "Work",
    "Personal Projects",
    "Daily Study",
    "Daily Tasks"
  ];

  @override
  Widget build(BuildContext context) {
    return 
       Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  ImagesName.bgLight,
                ),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Text("Add Task"),
            DropdownButtonFormField(
              value: _selectedValue,
      
              items: [
              DropdownMenuItem(
                value: "work",
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(taskGroup[0]), TaskGroupsIcons.work],
                
              )),
              DropdownMenuItem(
                value: "personalProject",
      
                  child: Text(taskGroup[1])),
              DropdownMenuItem(
                value: "dailyStudy",
                  child: Text(taskGroup[2])),
              DropdownMenuItem(
                value: "dailyTasks",
                  child: Text(taskGroup[3]))
            ], onChanged: (value) {
              setState(() {
                _selectedValue=value!;
              });
      
            })
          ],
        ),
      
    );
  }
}
