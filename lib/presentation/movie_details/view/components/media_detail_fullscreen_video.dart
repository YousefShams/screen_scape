import 'package:flutter/material.dart';
import 'package:screen_scape/domain/models/media_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MediaDetailsFullscreenVideo extends StatefulWidget {
  final MediaVideo video;
  final int seconds;
  const MediaDetailsFullscreenVideo({Key? key, required this.video, required this.seconds}) : super(key: key);

  @override
  State<MediaDetailsFullscreenVideo> createState() => _MediaDetailsFullscreenVideoState();
}

class _MediaDetailsFullscreenVideoState extends State<MediaDetailsFullscreenVideo> {
  late YoutubePlayerController vidController;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(vidController.value.isFullScreen) {
          vidController.toggleFullScreenMode();
          Navigator.pop(context, [vidController.value.position.inMilliseconds]);
          return false;
        }
        Navigator.pop(context, [vidController.value.position.inMilliseconds]);
        return false;
      },
      child: Scaffold(
        body: YoutubePlayerBuilder(
          onExitFullScreen: () { },
          player: YoutubePlayer(
            controller: vidController,
            onReady: () {
              vidController.seekTo(Duration(milliseconds: widget.seconds));
            },
            width: double.maxFinite,
          ),
          builder: (context, player) {
            return Center(
              child: player,
            );
          }
        )
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    vidController = YoutubePlayerController(
        initialVideoId: widget.video.key,
        flags: const YoutubePlayerFlags(
            autoPlay: false, disableDragSeek: true,
            showLiveFullscreenButton: false, forceHD: true
        )
    );
    vidController.toggleFullScreenMode();
  }

  @override
  void dispose() {
    vidController.dispose();
    super.dispose();
  }
}
