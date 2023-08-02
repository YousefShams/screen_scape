import 'package:flutter/material.dart';

import '../functions/functions.dart';


  Image defaultNetworkImage(String? path, {bool cover = false}) {
    return Image.network(
      AppFunctions.getNetworkImagePath(path),
      isAntiAlias: true,
      fit: (cover) ? BoxFit.cover : BoxFit.contain,
      errorBuilder: (context , _ , __) {
        return Image.network(AppFunctions.getNetworkImagePath(path),
          errorBuilder: (context , _ , __) {
            return Image.network(AppFunctions.getNetworkImagePath(null));
          },
        );
      },
    );
  }

