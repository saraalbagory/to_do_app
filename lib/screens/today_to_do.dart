import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_colors.dart';
import 'package:to_do_app/common/images_name.dart';
import 'package:to_do_app/widgets/to_do_card.dart';

class TodayToDo extends StatefulWidget {
  const TodayToDo({super.key});

  @override
  State<TodayToDo> createState() => _TodayToDoState();
}

class _TodayToDoState extends State<TodayToDo> {
  int _currentIndex = 0;
  // static const List<String> tasks=[" "];
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
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      thickness: 0,
                      height: 20,
                      color: Colors.transparent,
                    ),
                    itemBuilder: (context, index) {
                      return const ToDoCard();
                    
                    },
                    itemCount: 5,
                  ),
                )
              ],
            ),
          ),
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
                
                onPressed: () {}),
          ),
        ));
  }
}
