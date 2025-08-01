import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Palette{
  static  const  Color scaffold = Color(0xFFF0F2F5);
  static const Color facebookColor = Color(0xFF1777F2);
  static const Color online = Color(0xFF4BCB1F);
  static const LinearGradient roomGradient = LinearGradient(colors: [Color(0xFF496AE1), Color(0xFFCE48B1)]);
  static const LinearGradient storyGradient = LinearGradient(begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],);
}