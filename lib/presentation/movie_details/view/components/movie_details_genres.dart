import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_fonts.dart';
import 'package:screen_scape/app/resources/app_values.dart';

class MovieDetailsGenres extends StatelessWidget {
  final List<String> genres;
  const MovieDetailsGenres({Key? key, required this.genres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppPadding.pagePadding;
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(p,0,p,p),
        child: Text(genres.join(", "),
            style: Theme.of(context).textTheme.labelMedium?.
            copyWith(fontSize: AppFonts.smallerFontSize),
          overflow: TextOverflow.ellipsis, maxLines: 2, textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
