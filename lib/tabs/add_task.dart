import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/common/custom_elevated_button.dart';
import 'package:to_do_app/common/custom_text_field.dart';
import 'package:to_do_app/common/images_name.dart';
//import 'package:to_do_app/common/task_groups_icons.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  // var _selectedValue = "work";
  DateTime selectedDate=DateTime.now();
  DateFormat dateFormat=DateFormat('yyyy/MM/dd');
  final List<String> taskGroup = [
    "Work",
    "Personal Projects",
    "Daily Study",
    "Daily Tasks"
  ];
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();
  final TextEditingController taskGroupController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
         padding: const EdgeInsets.all(15),
        //  width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  ImagesName.bgLight,
                ),
                fit: BoxFit.cover),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                 // color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
                            
              // Container(
              //   padding: EdgeInsets.all(8),
              //   decoration: BoxDecoration(
              //     borderRadius:  BorderRadius.all(Radius.circular(20)),
              //     color: Colors.white,
              //   ),
                            
              //   child: DropdownButtonFormField(
              //       icon: ImageIcon(
              //         AssetImage(ImagesName.dropDownIcon),
              //         color: Colors.black,
              //       ),
              //       value: _selectedValue,
              //       decoration: InputDecoration(
              //         labelText: "Task Group",
              //         labelStyle: TextStyle(
              //           fontWeight: FontWeight.w600,
              //           color: Colors.grey,
              //         ),
              //         prefixIcon: Padding(
              //           padding: const EdgeInsets.all(10.0),
              //           child: prefixIconFinder(_selectedValue),
              //         ),
              //         border: InputBorder.none,
              //         fillColor: Colors.white,
              //         focusedBorder:  InputBorder.none,
              //       ),
              //       items: [
              //         DropdownMenuItem(value: "work", child: Text(taskGroup[0])),
              //         DropdownMenuItem(
              //             value: "personalProject", child: Text(taskGroup[1])),
              //         DropdownMenuItem(
              //             value: "dailyStudy", child: Text(taskGroup[2])),
              //         DropdownMenuItem(value: "dailyTasks", child: Text(taskGroup[3]),
              //         ),
              //       ],
              //       onChanged: (value) {
              //         setState(() {
              //           _selectedValue = value!;
              //         });
              //       }),
              // ),
              CustomTextField(
                  labelText: "Task Group Name",
                  controller: taskGroupController),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                labelText: "Task Name",
                maxLines: 1,
                controller: taskNameController,
                validator: (p0) {
                  if (p0 == null || p0 == "") {
                    return "The Task Name cannt be empty";
                  } else if (p0.length < 5) {
                    return "The Task Name cannt be less than five";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                labelText: "Description",
                maxLines: 5,
                controller: taskDescriptionController,
                validator: (p0) {
                  if (p0 == null || p0 == "") {
                    return "The Task Name cannt be empty";
                  } else if (p0.length < 5) {
                    return "The Task Name cannt be less than five";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context)
                          .primaryColor
                          .withOpacity(0.1), // Shadow color
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: const Offset(
                          0, 3), // Changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month_rounded,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.8),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Task Date",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                        Text(dateFormat.format(selectedDate),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ))
                      ],
                    ),
                  
                    Expanded(
                      child: IconButton(
                        alignment: Alignment.centerRight,
                        mouseCursor: MouseCursor.defer,
                        onPressed: () async {
                          var date=await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              initialDate: selectedDate,
                              lastDate: DateTime.now()
                                  .add(const Duration(days: 356))
                                  );
                          if (date !=null){
                            setState(() {
                              selectedDate=date;
                            });
                          }
                        },
                        icon: ImageIcon(
                          AssetImage(ImagesName.dropDownIcon),
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()){
                    Navigator.pop(context);
                            
                    }
                            
                  },
                  childText: "Add Task")
            ],
          ),
        ));
  }

  // Widget prefixIconFinder(_selectedValue) {
  //   if (_selectedValue == "work") {
  //     return TaskGroupsIcons.work;
  //   } else if (_selectedValue == "dailyStudy") {
  //     return TaskGroupsIcons.dailyStudy;
  //   }
  //   else if (_selectedValue == "dailyTasks") {
  //     return TaskGroupsIcons.dailyTasks;

  //   }
  //   else if (_selectedValue == "personalProject") {
  //     return TaskGroupsIcons.personalProjects;
  //   }
  //   else{
  //     return Icon(Icons.work);
  //   }
  // }
}
