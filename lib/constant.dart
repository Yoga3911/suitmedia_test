import 'package:flutter/material.dart';

class MyColor {
  MyColor._();

  static const black = Color(0xFF04021D);
  static const green = Color(0xFF2B637B);

  static ButtonStyle buttonStyle(Size size) {
    return ElevatedButton.styleFrom(
      backgroundColor: MyColor.green,
      fixedSize: Size(size.width, 45),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
