
import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {

  double getHeight() {
    return MediaQuery.of(this).size.height;
  }

  double getWidth() {
    return MediaQuery.of(this).size.width;
  }
  
}

extension DateFromString on String {

  DateTime getDateTime() {
    final ymd = split('-').map((e) => int.parse(e)).toList();
    return DateTime(ymd.first, ymd[1], ymd.last);
  }

}
