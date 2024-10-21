import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/status_filter.dart';
import 'package:to_do_app/widgets/to_do_card.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final List<String> status = ["All", "Done", "In-progress", "To-do"];
  EasyInfiniteDateTimelineController? calunderController =
      EasyInfiniteDateTimelineController();
      DateTime selectedDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          EasyInfiniteDateTimeLine(
            showTimelineHeader: false,
            firstDate: DateTime(2020),
            focusDate:selectedDate,
            lastDate: DateTime(2025),
            activeColor: Theme.of(context).primaryColor,
            onDateChange: (newDate) {
              setState(() {
                selectedDate=newDate;
              });
            },
            dayProps: EasyDayProps(
              height: 80,
              width: 55,
              inactiveDayStyle: DayStyle(
                  dayNumStyle: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  dayStrStyle: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 12)),
              activeDayStyle: const DayStyle(
                dayStrStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 12),
              ),
            ),
            selectionMode: const SelectionMode.autoCenter(),
          ),
          // EasyDateTimeLine(
          //   //headerProps: EasyHeaderProps(),
          //   initialDate: DateTime(2020),
          //   onDateChange: (selectedDate) {},
          //   activeColor: Theme.of(context).primaryColor,
          //   dayProps: EasyDayProps(
          //     height: 80,
          //     width: 55,
          //     inactiveDayStyle: DayStyle(
          //         decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(10)),
          //         dayStrStyle:
          //             TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
          //     activeDayStyle: DayStyle(
          //       dayStrStyle: TextStyle(
          //           fontWeight: FontWeight.w600,
          //           color: Colors.white,
          //           fontSize: 12),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, // Set horizontal scroll direction
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StatusFilter(status: status[0]),
                      const SizedBox(
                        width: 20,
                      ),
                      StatusFilter(status: status[1]),
                      const SizedBox(
                        width: 20,
                      ),
                      StatusFilter(status: status[2]),
                      const SizedBox(
                        width: 20,
                      ),
                      StatusFilter(status: status[3])
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return const ToDoCard();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                itemCount: 8),
          )
        ],
      ),
    );
  }
}
