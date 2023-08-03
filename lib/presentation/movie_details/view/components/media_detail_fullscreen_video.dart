import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen_scape/app/components/image_blur.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import 'package:screen_scape/domain/models/media_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MediaDetailsFullscreenVideo extends StatefulWidget {
  final MediaVideo video;
  const MediaDetailsFullscreenVideo({Key? key, required this.video}) : super(key: key);

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
        body: Stack(
          alignment: Alignment.center,
          children: [
            ImageBlur(networkImagePath: YoutubePlayer.getThumbnail(
                videoId: widget.video.key, quality: ThumbnailQuality.standard),
                blur: 15, darkness: 0.65),
            YoutubePlayerBuilder(
                onExitFullScreen: () { },
                player: YoutubePlayer(
                  controller: vidController,
                  width: context.getWidth(),
                  onEnded: (_) {
                    vidController.seekTo(const Duration(seconds: 0));
                    vidController.pause();
                  },
                ),
                builder: (context, player) {
                  return Center(child: player);
                }
            )
          ],
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
            autoPlay: true, disableDragSeek: false, mute: false,
            showLiveFullscreenButton: false, forceHD: true
        )
    );
    vidController.toggleFullScreenMode();
  }

  @override
  void dispose() {
    vidController.dispose();
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.dispose();
  }
}
