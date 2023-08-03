import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screen_scape/app/constants/constants.dart';
import 'package:screen_scape/app/resources/app_strings.dart';
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

  static String getNetworkImagePath(String? imgPath, {bool max = false}) {
    if(imgPath==null) return "https://i0.wp.com/port2flavors.com/wp-content/uploads/2022/07/placeholder-614.png?fit=1200%2C800&ssl=1";

    if(imgPath.contains("http")) {
      return imgPath;
    }
    else {
      final base = max ?  AppConstants.originalImageBaseUrl : AppConstants.imageBaseUrl;
      return "$base$imgPath";
    }
  }

  static Future<void> saveNetworkImageToGallery(String path) async {
    try {
      final url = getNetworkImagePath(path);
      final response = await get(Uri.parse(url));


      await ImageGallerySaver.saveImage(
        response.bodyBytes,
        quality: 100,
      );

      showToastMessage(AppStrings.imageSaved, isSuccess: true);
    }

    catch(e) {
      showToastMessage("Some error occurred, try again later.", isSuccess: true);
    }
  }

  static Future<Uint8List> getNetworkImageBytes(String path, bool max) async {
    try {
      final url = getNetworkImagePath(path, max: max);
      final response = await get(Uri.parse(url));
      return Uint8List.fromList(response.bodyBytes);
    }
    catch(e) {
      rethrow;
    }
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

  // static Future<Image> compressImage(Uint8List image, int qualityPercentage, String name) async {
  //
  //   var result = await FlutterImageCompress.compressWithList(
  //     image,
  //     minWidth: 100,
  //     minHeight: 100,
  //     quality: qualityPercentage,
  //   );
  //
  //   return Image.memory(result);
  // }

  // static Future<Color> getImagePalette (ImageProvider imageProvider) async {
  //   final PaletteGenerator paletteGenerator = await PaletteGenerator
  //       .fromImageProvider(imageProvider);
  //   return paletteGenerator.dominantColor!.color;
  // }

  static String capitalizeText(String text) {
    return "${text[0].toUpperCase()}${text.substring(1)}";
  }

  static List<Widget> getStars(double rating) {
    double starsCount = rating/2;
    double totalCount = 5;
    List<Icon> stars = [];
    while(totalCount > 0) {
      if(starsCount >= 1) {
        stars.add(const Icon(Icons.star_rounded, color: Colors.orange));
      }
      else if(starsCount > 0 && starsCount < 1) {
        if(starsCount >= 0.7) {
          stars.add(const Icon(Icons.star_rounded, color: Colors.orange));
        }
        else if (starsCount < 0.3) {
          stars.add(const Icon(Icons.star_border_rounded, color: Colors.orange));
        }
        else {
          stars.add(const Icon(Icons.star_half_rounded, color: Colors.orange));
        }
      }
      else {
        stars.add(const Icon(Icons.star_border_rounded, color: Colors.orange));
      }
      if(starsCount > 0) starsCount--;
      totalCount--;
    }
    return stars;
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