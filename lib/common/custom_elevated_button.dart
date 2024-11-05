import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.onPressed, required this.childText});
  final void Function() onPressed;
  final String childText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        childText,
        style: TextStyle(
            color: Theme.of(context).colorScheme.surface, fontSize: 15),
      ),
      
    );
  }
}
