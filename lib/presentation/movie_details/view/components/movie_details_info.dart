import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_values.dart';


class MovieDetailsInfo extends StatelessWidget {
  final DateTime releaseDate;
  const MovieDetailsInfo({Key? key, required this.releaseDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3 , horizontal: 10),
      margin: const EdgeInsets.only(top: AppSpacing.verticalSpaceBetweenTitleAndText),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 2.0),
            child: Icon(Icons.date_range_rounded, size: 20,),
          ),
          const SizedBox(width: 5),
          Text(
            "${releaseDate.year}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color :Theme.of(context).textTheme.labelMedium?.color,
              leadingDistribution: TextLeadingDistribution.proportional
            ),
          )
        ],
      ),
    );
  }
}
