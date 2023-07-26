import 'package:flutter/material.dart';

import '../resources/app_values.dart';

class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.titleVerticalPadding,
      horizontal: AppPadding.pagePadding),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
