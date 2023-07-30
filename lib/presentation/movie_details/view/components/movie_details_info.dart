import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_values.dart';


class MovieDetailsInfo extends StatelessWidget {
  final String info;
  final IconData icon;
  const MovieDetailsInfo({Key? key, required this.info, required this.icon}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Icon(icon, size: 20,),
          ),
          const SizedBox(width: 5),
          Text(
            info,
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
