import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:screen_scape/app/constants/constants.dart';

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

  static String getNetworkImagePath(String? imgPath) {
    if(imgPath==null) "https://www.kvitkov.cz/wp-content/uploads/2020/10/image-placeholder.png";
    return "${AppConstants.imageBaseUrl}$imgPath";
  }

  static int getGenreIDFromString(String genre) {
    final genresIDs = AppConstants.genres.keys.toList();
    final genresStrings = AppConstants.genres.values
        .map((e) => e.toLowerCase()).toList();
    final index = genresStrings.indexOf(genre.toLowerCase());

    return genresIDs[index];
  }


  static Future<Image> compressImage(Uint8List image, int qualityPercentage, String name) async {

    var result = await FlutterImageCompress.compressWithList(
      image,
      minWidth: 100,
      minHeight: 100,
      quality: qualityPercentage,
    );

    return Image.memory(result);
  }

  static Future<Color> getImagePalette (ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator = await PaletteGenerator
        .fromImageProvider(imageProvider);
    return paletteGenerator.dominantColor!.color;
  }

  static String capitalizeText(String text) {
    return "${text[0].toUpperCase()}${text.substring(1)}";
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