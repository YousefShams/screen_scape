import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_colors.dart';
import 'package:screen_scape/domain/models/member_credits.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_details_cast_list.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_details_genres.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_details_images.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_details_overview.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_details_rating.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_details_title.dart';
import '../../../../domain/models/media.dart';
import '../../../../domain/models/media_video.dart';
import 'media_details_videos.dart';


class MovieDetailsBottom extends StatefulWidget {
  final Media movie;
  final MemberCredits credits;
  final List<MediaVideo> videos;
  final List<String> imagesPaths;
  const MovieDetailsBottom({Key? key, required this.movie,
    required this.imagesPaths, required this.credits, required this.videos,}) : super(key: key);

  @override
  State<MovieDetailsBottom> createState() => _MovieDetailsBottomState();
}

class _MovieDetailsBottomState extends State<MovieDetailsBottom> {
  final controller = DraggableScrollableController();
  double blurValue = 0.0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      final percentageFactor = (controller.size - 0.37) /(0.95-0.37);

      setState(() {
        blurValue = percentageFactor*15;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.37,
      minChildSize: 0.37,
      maxChildSize: 0.95,
      controller: controller,
      //snap: true,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
              color: AppColors.scaffoldBrighterDarkBackground,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              )
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
            child: ListView(
              controller: scrollController,
              children: [
                MovieDetailsTitle(name: widget.movie.name, rating: widget.movie.rating),
                MovieDetailsRating(rating: widget.movie.rating),
                MovieDetailsOverview(overview: widget.movie.overview),
                MovieDetailsGenres(genres: widget.movie.getGenres().map((e) => e.name).toList()),
                MediaDetailsVideos(videos: widget.videos),
                MovieDetailsImages(imagesPaths: widget.imagesPaths),
                MovieCreditsList(credits: widget.credits),
              ],
            ),
          ),
        );
      },
    );
  }
}
