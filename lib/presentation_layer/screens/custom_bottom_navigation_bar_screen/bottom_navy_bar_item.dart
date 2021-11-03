import 'package:flutter/material.dart';

class BottomNavyBarItem {
  final Widget icon;
  final Widget title;
  final Color activeColor;
  final Color? inActiveColor;
  final TextAlign? textAlign;

  BottomNavyBarItem({
    required this.icon,
     required this.title,
    this.activeColor =  Colors.blue,
    this.inActiveColor,
    this.textAlign,
  });
}
