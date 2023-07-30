import 'package:flutter/material.dart';
import 'package:screen_scape/app/functions/functions.dart';
import 'package:screen_scape/app/resources/app_fonts.dart';
import 'package:screen_scape/app/resources/app_routes.dart';
import 'package:screen_scape/app/resources/app_styles.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import 'package:screen_scape/domain/models/genre_media_model.dart';
import 'package:screen_scape/domain/models/media.dart';
import '../../../../app/resources/app_colors.dart';

class HomeGenreItem extends StatelessWidget {
  final List<Media> movies;
  final String genreName;
  final Color shadowColor;
  const HomeGenreItem({Key? key, required this.movies, required this.genreName, required this.shadowColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double size = 180;
    const bR = BorderRadius.only(
      topLeft: Radius.circular(70),
      topRight: Radius.circular(15),
      bottomRight: Radius.circular(70),
      bottomLeft: Radius.circular(15),
    );

    return Padding(
      padding: const EdgeInsets.only(top:AppPadding.pagePadding,
          left: AppPadding.pagePadding, right: AppPadding.pagePadding),
      child: SizedBox(
        width: size,
        child: GestureDetector(
          onTap: () { Navigator.pushNamed(context, AppRoutes.genreMoviesRoute,
            arguments: GenreMedia(genreName, movies));
            },
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: size, height: size,
                decoration: BoxDecoration(
                    borderRadius: bR,
                    image: DecorationImage(
                        alignment: Alignment.topCenter, fit: BoxFit.cover,
                        image: NetworkImage(AppFunctions.getNetworkImagePath(movies.first.imgPath))
                    ),
                    boxShadow: [
                      BoxShadow(color: shadowColor.withOpacity(0.5),
                          blurRadius: 17, offset: const Offset(0, 5))
                    ]
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: size, height: size,
                decoration: BoxDecoration(
                  borderRadius: bR,
                  gradient: AppStyles.imageGradient,
                ),
                child: Text(AppFunctions.capitalizeText(genreName),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: AppFonts.boldFontWeight,
                    shadows: [const Shadow(color: AppColors.primaryColorDarker, blurRadius: 0,
                        offset: Offset(2, 2)),  ]
                  ),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
