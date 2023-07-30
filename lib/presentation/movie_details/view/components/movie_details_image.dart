import 'package:flutter/material.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import 'package:screen_scape/app/resources/app_styles.dart';

class MovieDetailsImage extends StatelessWidget {
  final String imgPath;
  const MovieDetailsImage({Key? key, required this.imgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const heightFactor = 0.55;
    const borderRadius = BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50));
    return Container(
      alignment: Alignment.bottomCenter,
      width: double.maxFinite,
      height: context.getHeight()*heightFactor,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imgPath),
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
    );
  }
}


/*

Container(
          alignment: Alignment.bottomCenter,
          width: double.maxFinite,
          height: context.getHeight()*0.55,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imgPath),
              ),
              borderRadius: borderRadius,
              boxShadow: [BoxShadow(color: imageColor, blurRadius: 30, offset: const Offset(0, 20))]
          ),
          child: Container(
            width: double.maxFinite,
            height: context.getHeight()*0.55,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              gradient: AppStyles.lighterImageGradient
            ),
          ),
        ),

*/