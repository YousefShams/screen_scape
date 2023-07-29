import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_colors.dart';
import 'package:screen_scape/app/resources/app_styles.dart';
import 'package:screen_scape/app/resources/app_values.dart';

class MovieDetailsTitle extends StatelessWidget {
  final String name;
  final double rating;
  const MovieDetailsTitle({Key? key, required this.name, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppPadding.pagePadding;
    return Padding(
      padding: const EdgeInsets.fromLTRB(p,0,p,p/2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              name, maxLines: 3, overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
              shadows: AppStyles.textSpecialShadows
            ),),
          ),
          ],
      ),
    );
  }
}
