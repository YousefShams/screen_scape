import 'package:flutter/material.dart';

import '../../../../app/components/image_blur.dart';

class PersonBlur extends StatelessWidget {
  final String? imagePath;
  const PersonBlur({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(imagePath==null) return const SizedBox.shrink();
    return ImageBlur(networkImagePath: imagePath!, darkness: 0.4, gradient: true);
  }
}
