// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import 'package:screen_scape/app/transition/page_transition.dart';
import 'package:screen_scape/domain/models/media_video.dart';
import 'package:screen_scape/presentation/movie_details/view/components/media_detail_fullscreen_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MediaDetailsVideo extends StatefulWidget {
  final MediaVideo video;
  final int index;
  const MediaDetailsVideo({Key? key, required this.video, required this.index}) : super(key: key);

  @override
  State<MediaDetailsVideo> createState() => _MediaDetailsVideoState();
}

class _MediaDetailsVideoState extends State<MediaDetailsVideo> {

  late YoutubePlayerController vidController;
  int seconds = 0;

  @override
  Widget build(BuildContext context) {
    const p = AppPadding.pagePadding;
    const aspectRatio = 15/9;
    return Padding(
      padding: const EdgeInsets.only(left: p),
      child: YoutubePlayer(
        controller: vidController,
        aspectRatio: aspectRatio,
        width: aspectRatio*190,
        liveUIColor: Theme.of(context).primaryColor,
        showVideoProgressIndicator: true,
        onEnded: (_) { vidController.pause(); },
        progressIndicatorColor: Theme.of(context).primaryColor,
        bottomActions: [
          const Spacer(),
          IconButton(
              onPressed: () {
                vidController.pause();
                Navigator.push(context, PageTransition(
                    MediaDetailsFullscreenVideo(video: widget.video, seconds: seconds,))).then((values) {
                      SystemChrome.setPreferredOrientations(DeviceOrientation.values);
                      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);
                      vidController.seekTo(Duration(milliseconds: values[0]));
                      vidController.play();
                      setState(() {
                        seconds = values[0];
                      });
                    }

                );
              },
              icon: const Icon(Icons.fullscreen,color: Colors.white, size: 25,)
          )
        ],
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

    vidController.addListener(() {
      setState(() {
        seconds = vidController.value.position.inMilliseconds;
      });
    });
  }

  @override
  void dispose() {
    vidController.dispose();
    super.dispose();
  }
}
