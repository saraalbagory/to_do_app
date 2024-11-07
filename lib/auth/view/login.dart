import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/auth/view/register.dart';
import 'package:to_do_app/auth/widgets/custom_auth_text_field.dart';
import 'package:to_do_app/common/app_colors.dart';
import 'package:to_do_app/common/custom_elevated_button.dart';
import 'package:to_do_app/common/images_name.dart';
import 'package:to_do_app/common/remote/firebase_services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_app/screens/today_to_do.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const String routeName = "LoginScreen";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    ImagesName.bgLight,
                  ),
                  fit: BoxFit.cover)),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Please enter your email address \n and enter your password',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                  // textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  " Email",
                  style: TextStyle(fontSize: 16),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                CustomAuthTextField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  keyboardTyp: TextInputType.emailAddress,
                  validator: (p0) {
                    if (isValidEmail(p0 ?? '')) {
                      return null;
                    } else {
                      return 'Invalid email';
                    }
                  },
                  prefixIcon: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const Icon(
                        Icons.email_outlined,
                        // color: Colors.black,
                        size: 18,
                      )),
                ),
                const Text(
                  " Password",
                  style: TextStyle(fontSize: 16),
                ),
                CustomAuthTextField(
                  controller: passwordController,
                  hintText: 'Enter your Password',
                  password: true,
                  prefixIcon: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const Icon(
                        Icons.lock_open_outlined,
                        size: 18,
                      )),
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Password cannot be empty';
                    } else if (p0.length < 7) {
                      return 'Password should be at least 7 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await login();
                        Navigator.popAndPushNamed(context, TodayToDo.routeName);
                      }
                    },
                    childText: "Login"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Register.routeName);
                        },
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        )),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                        child: Divider(
                      endIndent: 10,
                      indent: 10,
                    )),
                    Text('or'),
                    Expanded(
                        child: Divider(
                      endIndent: 10,
                      indent: 10,
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.facebook,
                        color: Colors.black,
                      ),
                      style: IconButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(249, 250, 252, 1)),
                    ),
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.apple,
                        color: Colors.black,
                      ),
                      style: IconButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(249, 250, 252, 1)),
                    ),
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.facebook,
                        color: Colors.blue,
                      ),
                      style: IconButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(249, 250, 252, 1)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String inputText) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(inputText);
  }

  login() async {
    try {
      await FirebaseServices.login(
          emailController.text, passwordController.text);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.workColor,
          textColor: AppColors.workIconColor,
          fontSize: 16.0);
    }
  }
}
