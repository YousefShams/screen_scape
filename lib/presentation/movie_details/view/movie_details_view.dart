import 'package:flutter/material.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import 'package:screen_scape/domain/models/media.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_details_bottom.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_details_cubit_widget.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_details_image.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_details_image_blur.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_details_info.dart';
import '../../../app/functions/functions.dart';


class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = ModalRoute.of(context)!.settings.arguments as Media;
    return MovieDetailsCubitWidget(
      media: media,
      builder: (cubit) =>
          Scaffold(
            body: Stack(
              children: [
                MovieDetailsBlur(networkImagePath:
                AppFunctions.getNetworkImagePath(media.imgPath)),
                Column(
                  children: [
                    MovieDetailsImage(
                      imgPath: AppFunctions.getNetworkImagePath(media.imgPath),
                      bookmarked : cubit.bookmarked,
                      onAdd : () { cubit.toggleOnWatchlist(media); }
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MovieDetailsInfo(
                            icon: Icons.date_range_rounded,
                            info: "${media.releaseDate.getDateTime().year}/"
                                "${media.releaseDate.getDateTime().month}"
                        ),
                        const SizedBox(width: 10),
                        MovieDetailsInfo(info: media.popularity.round().toString(),
                            icon: Icons.trending_up_rounded)
                      ],
                    )
                  ],
                ),
                MovieDetailsBottom(
                  movie: media,
                  videos: cubit.trailers,
                  imagesPaths: cubit.imagesPaths,
                  credits: cubit.credits,
                )
              ],
            ),
          ),
    );
  }
}
