import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/common/custom_elevated_button.dart';
import 'package:to_do_app/common/custom_text_field.dart';
import 'package:to_do_app/common/images_name.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});
  static const String routeName = "EditScreen";
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat('yyyy/MM/dd');

  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();
  final TextEditingController taskGroupController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  ImagesName.bgLight,
                ),
                fit: BoxFit.cover)),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Edit Task"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              // padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      labelText: "Task Group Name",
                      controller: taskGroupController),
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
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .primaryColor
                              .withOpacity(0.04), // Shadow color
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset:
                              const Offset(0, 3), // Changes position of shadow
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
                              var date = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  initialDate: selectedDate,
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 356)));
                              if (date != null) {
                                setState(() {
                                  selectedDate = date;
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.pop(context);
                            }
                          },
                          childText: "Edit Task"),
                      CustomElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          childText: "cancel"),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
