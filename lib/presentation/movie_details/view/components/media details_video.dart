// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen_scape/app/resources/app_colors.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import 'package:screen_scape/domain/models/media_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MediaDetailsVideo extends StatefulWidget {
  final MediaVideo video;
  const MediaDetailsVideo({Key? key, required this.video}) : super(key: key);

  @override
  State<MediaDetailsVideo> createState() => _MediaDetailsVideoState();
}

class _MediaDetailsVideoState extends State<MediaDetailsVideo> {

  late YoutubePlayerController vidController;

  @override
  Widget build(BuildContext context) {
    const p = AppPadding.pagePadding;

    return Padding(
      padding: const EdgeInsets.only(left: p),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: YoutubePlayerBuilder(
          onEnterFullScreen: (){
            SystemChrome.setPreferredOrientations(DeviceOrientation.values);
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          },
            player: YoutubePlayer(
              controller: vidController,
              aspectRatio: 16/9,
              width: 16/9*170,
              liveUIColor: Theme.of(context).primaryColor,
              showVideoProgressIndicator: true,
              onEnded: (_) { vidController.seekTo(const Duration(seconds: 0)); },
              progressIndicatorColor: Theme.of(context).primaryColor,
            ),
            builder: (context, child) => ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                margin: const EdgeInsets.fromLTRB(p, p, 0, p),
                child: child,
              ),
            )
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    vidController = YoutubePlayerController(
        initialVideoId: widget.video.key,
        flags: const YoutubePlayerFlags(autoPlay: false, disableDragSeek: true,
          showLiveFullscreenButton: false, forceHD: true
        )
    );
  }

  @override
  void dispose() {
    vidController.dispose();
    super.dispose();
  }
}
