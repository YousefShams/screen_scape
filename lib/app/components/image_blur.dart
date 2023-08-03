import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';

class ImageBlur extends StatelessWidget {
  final String networkImagePath;
  final double darkness;
  final bool gradient;
  final double blur;
  const ImageBlur({Key? key, required this.networkImagePath,
    required this.darkness, this.gradient = false, this.blur = 50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).scaffoldBackgroundColor;
    final double opacity = min(max(darkness,0), 1);
    return Container(
      width: double.maxFinite, height: context.getHeight(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(networkImagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: (!gradient) ? color.withOpacity(opacity) : null,
            gradient: (gradient) ? LinearGradient(
              colors: [ color.withOpacity(opacity) , color.withOpacity(0.9) ],
              begin: Alignment.topRight, end: Alignment.bottomLeft,
            ) : null
          ),
        ),
      ),
    );
  }
}
