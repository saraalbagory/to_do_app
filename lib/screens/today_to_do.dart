import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_colors.dart';
import 'package:to_do_app/common/images_name.dart';
import 'package:to_do_app/tabs/add_task.dart';
import 'package:to_do_app/tabs/settings.dart';
import 'package:to_do_app/tabs/to_do_list.dart';
import 'package:to_do_app/widgets/to_do_card.dart';

class TodayToDo extends StatefulWidget {
  const TodayToDo({super.key});

  @override
  State<TodayToDo> createState() => _TodayToDoState();
}

class _TodayToDoState extends State<TodayToDo> {
  int _currentIndex = 0;
  int _currentTab=0;
   static const List  tabs=[ToDoList(),Settings(),AddTask()];
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
            title: Text("Today's Task"),
          ),
          body: tabs[_currentTab],
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(35.0)),
            child: BottomAppBar(
              elevation: 10,
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              padding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: BottomNavigationBar(
                
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                    _currentTab=index;
                  });
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.menu_rounded,
                      ),
                      label: "Menu"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.settings,
                      ),
                      label: "Settings")
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
              width:50,
             
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      // Theme.of(context).colorScheme.secondary.withOpacity(0.7)
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.4), // Your shadow color
                      blurRadius: 10.0,
                      spreadRadius: 10.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.transparent,),
            child: FloatingActionButton(
    
                  child: const Icon(
                    Icons.add,
                    // size: 26,
                    color: Colors.white,
                  ),
                
                onPressed: () {
                  setState(() {
                    _currentTab=2;
                  });
                }),
          ),
        ));
  }
}
