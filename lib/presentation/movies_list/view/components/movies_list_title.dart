import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import 'package:screen_scape/data/paths/current_path.dart';

import '../../../../app/components/page_title.dart';
import '../../../../app/functions/functions.dart';

class MoviesListTitle extends StatelessWidget {
  final String title;
  const MoviesListTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final typeName = CurrentEntity.getCurrentEntityPath().name;
    return Padding(
        padding: const EdgeInsets.only(top: AppPadding.pagePadding),
        child: PageTitle(title: "${AppFunctions.capitalizeText(title)} $typeName"));
  }
}

