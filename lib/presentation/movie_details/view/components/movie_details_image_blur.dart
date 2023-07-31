import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';

class MovieDetailsBlur extends StatelessWidget {
  final String networkImagePath;
  const MovieDetailsBlur({Key? key, required this.networkImagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: double.maxFinite, height: context.getHeight(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(networkImagePath),
          fit: BoxFit.cover,
        ),
      ),
      duration: const Duration(seconds: 3),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: AnimatedContainer(
          duration: const Duration(seconds: 3),
          color: Colors.black.withOpacity(0.2),
        ),
      ),
    );
  }
}
