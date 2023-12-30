import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../resources/app_assets.dart';

class BlurAnimation extends StatelessWidget {
  const BlurAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.bottomCenter,
              child: Lottie.asset(AppAssets.bubbles, frameRate: FrameRate(60)),
            ),
          ),Expanded(
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.bottomCenter,
              child: Lottie.asset(AppAssets.bubbles, frameRate: FrameRate(60)),
            ),
          ),
          BackdropFilter(
            filter : ImageFilter.blur(sigmaX: 50  ,sigmaY: 50),
            child: const SizedBox(),
          )
        ],
      ),
    );
  }
}
