import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_styles.dart';

import '../resources/app_values.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final bool extraTopPadding;
  const PageTitle({Key? key, required this.title, this.extraTopPadding = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: (extraTopPadding) ? AppPadding.pagePadding : 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.pagePadding,
        horizontal: AppPadding.pagePadding),
        child: Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(
          shadows: AppStyles.textSpecialShadows
        )),
      ),
    );
  }
}
