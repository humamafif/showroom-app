import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double heightMultiplier;
  static late double widthMultiplier;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    heightMultiplier = screenHeight / 100;
    widthMultiplier = screenWidth / 100;
  }
}