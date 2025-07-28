import 'package:flutter/material.dart';

class Categorybutton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;
  const Categorybutton({super.key, required this.label, required this.icon, required this.iconColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(
        label,
        style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500 ),
      ),
      icon: Icon(icon, color: iconColor,size: 24,),
    );
  }
}
