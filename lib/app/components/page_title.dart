import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_styles.dart';
import '../resources/app_values.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final bool extraTopPadding;
  final double paddingFactor;
  const PageTitle({Key? key, required this.title, this.extraTopPadding = true,
    this.paddingFactor = 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppPadding.pagePadding;
    return Padding(
      padding: EdgeInsets.only(top: (extraTopPadding) ? p : 0),
      child: Padding(
        padding: EdgeInsets.fromLTRB(p,p*paddingFactor,p,p),
        child: Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(
          shadows: AppStyles.textSpecialShadows)
        ),
      ),
    );
  }
}
