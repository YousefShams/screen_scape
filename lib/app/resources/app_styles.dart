import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppStyles {

  static const TextStyle loadingTextStyle = TextStyle(color: Colors.white,
      fontSize:AppFonts.tinyFontSize);

  static final textSpecialShadows = [const Shadow(color: AppColors.primaryColorDarker, blurRadius: 1,
      offset: Offset(2, 1))];

  static final imageGradient = LinearGradient(
      begin: Alignment.bottomCenter, end: Alignment.topCenter,
      colors: [Colors.black.withOpacity(0.95), Colors.black.withOpacity(0.7), Colors.black.withOpacity(0.3)],
      stops: const [0.05 , 0.5,  0.9]
  );

  static final lighterImageGradient = LinearGradient(
      begin: Alignment.bottomLeft, end: Alignment.topRight,
      colors: [Colors.black.withOpacity(0.8), Colors.black.withOpacity(0.5), Colors.black.withOpacity(0.2)],
      stops: const [0.05 , 0.5,  0.9]
  );

}