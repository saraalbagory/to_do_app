import 'package:flutter/material.dart';

class GroupsIcons extends StatelessWidget {
  final Color iconColor;
  final String imageUrl;
  final Color containerColor; 
  const GroupsIcons({super.key, required this.iconColor, required this.imageUrl, required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return  Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ImageIcon(
                    AssetImage(imageUrl),
                    color: iconColor,
                    size: 26,
                  ),
                );
  }
}