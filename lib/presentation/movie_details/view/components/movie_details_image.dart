import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:screen_scape/app/components/network_image.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import 'package:screen_scape/app/resources/app_colors.dart';
import 'package:screen_scape/app/resources/app_styles.dart';
import 'package:screen_scape/app/resources/app_values.dart';

class MovieDetailsImage extends StatelessWidget {
  final String imgPath;
  final Function onAdd;
  final bool bookmarked;
  const MovieDetailsImage({Key? key, required this.imgPath, required this.onAdd, required this.bookmarked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const heightFactor = 0.55;
    const borderRadius = BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50));
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          width: double.maxFinite,
          height: context.getHeight()*heightFactor,
          decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover,
              image: defaultNetworkImage(imgPath).image,
            ),
            borderRadius: borderRadius,
            //boxShadow: [BoxShadow(color: imageColor, blurRadius: 30, offset: const Offset(0, 20))]
          ),
          child: Container(
            width: double.maxFinite,
            height: context.getHeight()*heightFactor,
            decoration: BoxDecoration(
                borderRadius: borderRadius,
                gradient: AppStyles.lighterImageGradient
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.pagePadding),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2,sigmaY: 2),
                child: FloatingActionButton(
                  onPressed: () { onAdd(); },
                  elevation: 0,
                  backgroundColor: AppColors.primaryColor.withOpacity(0.3),
                  child: bookmarked ? const Icon(Icons.bookmark_added_rounded) :
                  const Icon(Icons.bookmark_add_rounded),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

