import 'package:flutter/material.dart';
import 'package:screen_scape/app/components/network_image.dart';
import 'package:screen_scape/app/resources/app_fonts.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import 'package:screen_scape/domain/models/media.dart';
import '../../../../app/resources/app_colors.dart';
import '../../../../app/resources/app_routes.dart';

class HomeMovieItem extends StatelessWidget {
  final Media movie;
  const HomeMovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double size = 130;
    return GestureDetector(
      onTap: (){ Navigator.pushNamed(context, AppRoutes.movieDetailsRoute, arguments: movie);},
      child: Padding(
        padding: const EdgeInsets.only(top:AppPadding.pagePadding, left: AppPadding.pagePadding),
        child: SizedBox(
          width: size,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size, height: size,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                      image: defaultNetworkImage(movie.imgPath).image
                    ),
                    boxShadow: [
                      BoxShadow(color: AppColors.topRatedShadow,
                        blurRadius: 15, offset: const Offset(3, 9))
                    ]
                ),
              ),
              const SizedBox(height: 10),
              Text(movie.name, style: Theme.of(context).textTheme.labelLarge
                  ?.copyWith(fontSize: AppFonts.smallerFontSize), textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
              Text(movie.getGenres().first.name, style: Theme.of(context).textTheme.labelMedium
                  ?.copyWith(fontSize: AppFonts.tinyFontSize),  textAlign: TextAlign.left),
            ],
          ),
        ),
      ),
    );
  }
}
