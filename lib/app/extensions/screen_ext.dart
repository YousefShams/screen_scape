
import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {

  double getHeight() {
    return MediaQuery.of(this).size.height;
  }

  double getWidth() {
    return MediaQuery.of(this).size.width;
  }
  
}
