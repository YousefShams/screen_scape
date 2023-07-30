import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_strings.dart';
import 'package:screen_scape/app/resources/app_values.dart';

class MovieDetailsOverview extends StatelessWidget {
  final String overview;
  const MovieDetailsOverview({Key? key, required this.overview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: Text( overview.isEmpty ? AppStrings.emptyOverview : overview,
        style: Theme.of(context).textTheme.bodyMedium,
      )
    );
  }
}
