import 'package:flutter/material.dart';
import 'package:to_do_app/auth/view/login.dart';
import 'package:to_do_app/auth/view/register.dart';
import 'package:to_do_app/common/app_theme.dart';
import 'package:to_do_app/screens/edit_screen.dart';
import 'package:to_do_app/screens/today_to_do.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: Login.routeName,
      routes: {
        TodayToDo.routeName: (context) => const TodayToDo(),
        EditScreen.routeName: (context) => const EditScreen(),
        Login.routeName: (context) => const Login(),
        Register.routeName: (context) => const Register(),
      },
    );
  }
}
