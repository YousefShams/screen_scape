import 'package:flutter/material.dart';


class MovieDetailsRating extends StatelessWidget {
  final double rating;
  const MovieDetailsRating({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_rounded, color: Colors.orange),
          Text("$rating", style: Theme.of(context).textTheme.labelMedium,),

        ],),
    );
  }
}
