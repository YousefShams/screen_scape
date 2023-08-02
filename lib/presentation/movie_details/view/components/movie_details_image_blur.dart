import 'package:flutter/material.dart';
import 'package:screen_scape/app/components/image_blur.dart';

class MovieDetailsBlur extends StatelessWidget {
  final String networkImagePath;
  final double darkness;
  const MovieDetailsBlur({Key? key, required this.networkImagePath, required this.darkness}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageBlur(networkImagePath: networkImagePath, darkness: darkness);
  }
}
