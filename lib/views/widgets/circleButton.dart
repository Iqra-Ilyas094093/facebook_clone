import 'package:flutter/material.dart';

class Circlebutton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  const Circlebutton({super.key, required this.icon, required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          onPressed: () {},
          icon: Icon(icon, size: iconSize,color: Colors.black,),
        ),
      ),
    );
  }
}
