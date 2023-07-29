import 'package:flutter/material.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';

import '../../../../app/functions/functions.dart';
import '../../../../app/resources/app_routes.dart';
import '../../../../app/resources/app_values.dart';
import '../../../../domain/models/movie.dart';

class GenreMoviesItem extends StatelessWidget {
  final Movie movie;
  const GenreMoviesItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppPadding.pagePadding;
    final image = NetworkImage(AppFunctions.getNetworkImagePath(movie.imgPath));
    return GestureDetector(
      onTap: (){ Navigator.pushNamed(context, AppRoutes.movieDetailsRoute, arguments: movie);},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: p),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(image: image, fit: BoxFit.cover, isAntiAlias: true),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.transparent.withOpacity(0.5), blurRadius: 23, offset: const Offset(0, 7))]
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.pagePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(movie.name, style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center, overflow: TextOverflow.fade,
                  maxLines: 2,),
                const SizedBox(height: 3),
                Text(movie.getGenres().first.name, textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
