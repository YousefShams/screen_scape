import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppFunctions {

  static void showToastMessage(text,{isError = true, isInfo = false, isSuccess=false, long = true}) {
    Color color = Colors.red;
    if(isInfo) { color = Colors.orangeAccent; }
    else if(isSuccess) { color = Colors.green; }

    Fluttertoast.showToast(
      msg: text,
      toastLength: (long) ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: color.withOpacity(0.92),
      textColor: Colors.white,
      fontSize: 13.0
    );
  }


  static String getHourString(int hour, int mins) {
    if (hour == 0) {
      return '12:$mins AM';
    } else if (hour == 12) {
      return '12:$mins PM';
    } else if (hour < 12) {
      return '$hour:$mins AM';
    } else {
      return '${hour - 12}:$mins PM';
    }
  }

}