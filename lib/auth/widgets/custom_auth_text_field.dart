import 'package:flutter/material.dart';
import 'package:to_do_app/common/custom_container.dart';

class CustomAuthTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType? keyboardTyp;
  final bool password;
  final String? Function(String?)? validator;
  const CustomAuthTextField(
      {super.key,
      this.validator,
      this.hintText,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.password = false,
      this.keyboardTyp});
  
  @override
  State<CustomAuthTextField> createState() => _CustomAuthTextfieldState();
}

class _CustomAuthTextfieldState extends State<CustomAuthTextField> {
  bool showPAssword = false;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardTyp,
        obscureText: widget.password && !showPAssword,
        validator: widget.validator,
        decoration: InputDecoration(
          filled: true,
         // fillColor: const Color.fromRGBO(249, 250, 252, 1),
         fillColor: const Color.fromARGB(255, 255, 255, 255),
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
        prefixIconColor: Theme.of(context).colorScheme.secondary,
        suffixIconColor: Theme.of(context).colorScheme.secondary ,
          suffixIcon: widget.password == true
              ? IconButton.filled(
                  style: IconButton.styleFrom(backgroundColor: Colors.white),
                  icon: Icon(
                    showPAssword == false
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    showPAssword = !showPAssword;
                    setState(() {});
                  },
                )
              : widget.suffixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
