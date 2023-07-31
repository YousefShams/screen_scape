import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:screen_scape/app/constants/constants.dart';

import '../../data/mapper/mapper.dart';
import '../../data/paths/current_path.dart';
import '../../data/paths/movie_paths.dart';
import '../../data/paths/tv_show_paths.dart';
import '../resources/app_routes.dart';

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
    if(imgPath==null) return "https://i0.wp.com/port2flavors.com/wp-content/uploads/2022/07/placeholder-614.png?fit=1200%2C800&ssl=1";
    return "${AppConstants.imageBaseUrl}$imgPath";
  }

  static int getGenreIDFromString(String genre) {
    final genresIDs = AppConstants.genres.keys.toList();
    final genresStrings = AppConstants.genres.values
        .map((e) => e.toLowerCase()).toList();
    final index = genresStrings.indexOf(genre.toLowerCase());

    return genresIDs[index];
  }

  static void updateCurrent(int newIndex, int prevIndex, context) {
    if(newIndex==1) {
      CurrentEntity.updateCurrentEntity(TVShowPaths(), TVShowMapper());
    }
    else if(newIndex==0) {
      CurrentEntity.updateCurrentEntity(MoviesPaths(), MovieMapper());
    }
  }

  static void navigate(int newIndex, int prevIndex, context) {
    if(prevIndex!=newIndex) {
      if(newIndex==2) {
        Navigator.pushReplacementNamed(context, AppRoutes.searchRoute);
      }
      else if(newIndex==3) {
        Navigator.pushReplacementNamed(context, AppRoutes.watchlistRoute);

      }
      else {
        Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
      }
    }
  }

  static String get topPathTitle {
    final path = CurrentEntity.getCurrentEntityPath().topPath;
    final title = path.substring(1).split("_").map(
            (word) => capitalizeText(word)).join(" ");
    return title;
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