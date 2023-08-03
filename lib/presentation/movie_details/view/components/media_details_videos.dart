import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import 'package:screen_scape/presentation/movie_details/view/components/media_details_video_preview.dart';
import '../../../../domain/models/media_video.dart';


class MediaDetailsVideos extends StatelessWidget {
  final List<MediaVideo> videos;
  const MediaDetailsVideos({Key? key, required this.videos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double videoHeight = 160;
    return Visibility(
      visible: videos.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.pagePadding),
        child: SizedBox(
          width: double.maxFinite, height: videoHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: videos.length,
            itemBuilder: (context, index) =>
                MediaDetailsVideoPreview(video: videos[index],
                  videoHeight:videoHeight, index: index,),
          ),
        ),
      ),
    );
  }
}
