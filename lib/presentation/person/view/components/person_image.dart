import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:screen_scape/app/functions/functions.dart';
import 'package:screen_scape/app/resources/app_assets.dart';
import 'package:screen_scape/app/resources/app_values.dart';

import '../../../../app/resources/app_colors.dart';

class PersonImage extends StatelessWidget {
  final String? personImagePath;
  final double size;
  const PersonImage({Key? key, required this.personImagePath, this.size = 50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.pagePadding),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: size,
            backgroundColor: Colors.blueGrey,
            backgroundImage: (personImagePath==null) ?
            null : Image.network(
              AppFunctions.getNetworkImagePath(personImagePath!),
              fit: BoxFit.contain, isAntiAlias: true,
            ).image,
            child: (personImagePath==null) ? Icon(Icons.person, size: size*7/5,
              color: AppColors.scaffoldDarkBackground,):null,
          )
        ],
      ),
    );
  }
}
