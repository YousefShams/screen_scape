
import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {

  static const primaryColor = Colors.purpleAccent;
  static const primaryColorDarker = Colors.purple;
  static final splashColor = Colors.purpleAccent.withOpacity(0.5);
  static const scaffoldLightBackground = Colors.white;
  static const scaffoldDarkBackground = Color.fromARGB(255, 0, 1,5);
  static const scaffoldBrighterDarkBackground = Color.fromRGBO(13, 16, 26,0.5);

  static final imageSplashColor = Colors.white.withOpacity(0.5);
  static final lightPrimaryColor = Colors.indigoAccent[300];
  static final topRatedShadow = Colors.orange.withOpacity(0.3);
  static final appGenresColors = [Colors.white, Colors.deepPurple, Colors.red,
    Colors.indigoAccent, Colors.greenAccent, Colors.amber,  Colors.pinkAccent];


  static Color getRandomColor() {
    final r = Random();
    Color color = Color.fromARGB(255,r.nextInt(256),r.nextInt(256),r.nextInt(256));
    while((color.red+color.green+color.blue)/3 < 150) {
      color = Color.fromARGB(255,r.nextInt(256),r.nextInt(256),r.nextInt(256));
    }
    return color;
  }
}