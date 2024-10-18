import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_theme.dart';
import 'package:to_do_app/screens/today_to_do.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home:  TodayToDo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

