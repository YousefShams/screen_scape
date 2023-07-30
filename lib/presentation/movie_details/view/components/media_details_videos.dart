import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_values.dart';

import '../../../../domain/models/media_video.dart';
import 'media details_video.dart';


class MediaDetailsVideos extends StatelessWidget {
  final List<MediaVideo> videos;
  const MediaDetailsVideos({Key? key, required this.videos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.pagePadding),
      child: SizedBox(
        width: double.maxFinite, height: 170,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: videos.length,
          itemBuilder: (context, index) => MediaDetailsVideo(video: videos[index]),
        ),
      ),
    );
  }
}
