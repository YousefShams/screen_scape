import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_details_bottom.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_details_cubit_widget.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_details_image.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_details_image_blur.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_details_info.dart';

import '../../../app/functions/functions.dart';
import '../../../domain/models/movie.dart';


class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return MovieDetailsCubitWidget(
      movie: movie,
      builder: (cubit) =>
          Scaffold(
            body: Stack(
              children: [
                MovieDetailsBlur(networkImagePath: AppFunctions.getNetworkImagePath(movie.imgPath)),
                Column(
                  children: [
                    MovieDetailsImage(
                      imgPath: AppFunctions.getNetworkImagePath(movie.imgPath),
                        releaseDate: movie.dateTime),
                    MovieDetailsInfo(releaseDate: movie.dateTime)
                  ],
                ),
                MovieDetailsBottom(
                  movie: movie,
                  imagesPaths: cubit.imagesPaths,
                  credits: cubit.credits,
                )
              ],
            ),
          ),
    );
  }
}
