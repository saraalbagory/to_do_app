import 'package:flutter/material.dart';

class StatusFilter extends StatelessWidget {
   final String status;
  const StatusFilter( {super.key,required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 17),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onPrimary,
                          letterSpacing: 0.2,
                        ),
                      ),
                    );
  }
}