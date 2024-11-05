import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key, required this.labelText,  this.maxLines=1, required this.controller, this.validator});
  final String labelText;
  final int? maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.04), // Shadow color
            spreadRadius: 5, // Spread radius
            blurRadius: 7, // Blur radius
            offset: const Offset(0, 3), // Changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        //autovalidateMode: AutovalidateMode.always,
        controller: widget.controller,
        validator:widget.validator ,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,

          labelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey,
            fontSize: 12
          ),
          border: InputBorder.none,
        ),
        maxLines: widget.maxLines,
      ),
    );
  }
}
