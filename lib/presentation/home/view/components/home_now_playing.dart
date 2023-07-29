import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_styles.dart';
import 'package:screen_scape/app/resources/app_values.dart';

class HomeTitle extends StatelessWidget {
  final String title;
  const HomeTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppPadding.pagePadding;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(p, p, p, p),
        child: Text(title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            shadows: AppStyles.textSpecialShadows
          ),),
      ),
    );
  }
}
