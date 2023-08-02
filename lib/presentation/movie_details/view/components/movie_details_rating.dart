import 'package:flutter/material.dart';
import 'package:screen_scape/app/functions/functions.dart';


class MovieDetailsRating extends StatelessWidget {
  final double rating;
  const MovieDetailsRating({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...AppFunctions.getStars(rating),
          const SizedBox(width: 5),
          Text(rating.toStringAsPrecision(2), style: Theme.of(context).textTheme.labelMedium,),

        ],),
    );
  }
}

