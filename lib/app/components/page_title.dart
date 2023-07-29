import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_styles.dart';

import '../resources/app_values.dart';

class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.pagePadding),
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
