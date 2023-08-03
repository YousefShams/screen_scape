// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import 'package:screen_scape/app/transition/page_transition.dart';
import 'package:screen_scape/domain/models/media_video.dart';
import 'package:screen_scape/presentation/movie_details/view/components/media_detail_fullscreen_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MediaDetailsVideoPreview extends StatelessWidget {
  final MediaVideo video;
  final double videoHeight;
  final int index;
  const MediaDetailsVideoPreview({Key? key, required this.video,
    required this.index, required this.videoHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final thumbnail = YoutubePlayer.getThumbnail(videoId: video.key,
        quality: ThumbnailQuality.high, webp: true);
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.pagePadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: videoHeight * 16/9,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                  image: Image.network(
                      thumbnail,).image, fit: BoxFit.cover),
              ),
            ),
            GestureDetector(
                onTap: () { Navigator.push(context, PageTransition(
                  MediaDetailsFullscreenVideo(video: video)
                )); },
                child: const Icon(Icons.play_arrow_rounded, size: 50, color: Colors.white,))
          ],
        ),
      ),
    );
  }
}
