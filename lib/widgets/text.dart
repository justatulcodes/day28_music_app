import 'package:flutter/material.dart';

Widget customText(String text, double size, Color color, [FontWeight weight = FontWeight.w500]) {
  return Text(text, 
  style: TextStyle(
    fontSize: size,
    color: color,
    fontWeight: weight
  ),);
}
