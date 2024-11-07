import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_app/auth/model/user_data_model.dart';
import 'package:to_do_app/auth/view/login.dart';
import 'package:to_do_app/auth/widgets/custom_auth_text_field.dart';
import 'package:to_do_app/common/app_colors.dart';
import 'package:to_do_app/common/custom_elevated_button.dart';
import 'package:to_do_app/common/images_name.dart';
import 'package:to_do_app/common/remote/firebase_services.dart';
import 'package:to_do_app/screens/today_to_do.dart';

class Register extends StatefulWidget {
  static const String routeName = "RegisterScreen";
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
          // height: double.infinity,
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
                  "SIGN UP",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),

                const SizedBox(
                  height: 30,
                ),
                const Text(
                  " Name",
                  style: TextStyle(fontSize: 16),
                ),
                CustomAuthTextField(
                  controller: nameController,
                  hintText: 'Enter your Name',
                  keyboardTyp: TextInputType.text,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'The Name cannot be empty';
                    } else if (p0.length < 5) {
                      return 'The Name should be at least 7 characters';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(
                    Icons.person,
                    size: 18,
                  ),
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
                      return 'Invalid Email';
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
                  hintText: 'Enter your password',
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
                      return 'password cannot be empty';
                    } else if (p0.length < 7) {
                      return 'password should be at leas 7 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomElevatedButton(onPressed: () async {
                  if(formKey.currentState!.validate())
                  {
                     await register();
                     Navigator.popAndPushNamed(context, TodayToDo.routeName);
                  }
                }, childText: "Sign Up"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Login.routeName);
                        },
                        child: Text(
                          'Login',
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

  register() async {
    try {
      await FirebaseServices.register(
          UserDataModel(name: nameController.text, email: emailController.text),
          passwordController.text);
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
