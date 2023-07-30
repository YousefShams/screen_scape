import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/data/paths/paths.dart';
import 'package:screen_scape/domain/models/credits.dart';
import 'package:screen_scape/domain/models/media_video.dart';
import 'package:screen_scape/presentation/movie_details/view_model/states.dart';
import '../../../data/repositories/media_repository.dart';
import '../../../domain/models/media.dart';


class MediaDetailsCubit extends Cubit<MediaDetailsState> {
  final Paths mediaPath;
  final MediaRepository mediaRepo;
  MediaDetailsCubit(this.mediaRepo, this.mediaPath) : super(MediaDetailsInitial());

  static MediaDetailsCubit get(context) => BlocProvider.of(context);

  //VARIABLES
  List<String> imagesPaths = [];

  List<MediaVideo> videos = [];
  List<MediaVideo> trailers = [];


  //late Color imageColor;
  late Credits credits;

  //EVENTS
  void getMediaDetails(Media media) async {
    await getMediaImages(media.id);
    await getMediaCredits(media.id);
    await getMediaVideos(media.id);
  }

  Future getMediaImages(int movieId) async {
    emit(MediaDetailsLoading());
    final path = "${mediaPath.basePath}${Paths.imagesPath(movieId)}";
    final result = await mediaRepo.getMediaImages(path);

    result.fold((failure){
      emit(MediaDetailsError(failure.message));
    },(resultPaths) {
      imagesPaths.addAll(resultPaths);
      emit(MediaDetailsSuccess());
    });
  }

  Future getMediaCredits(int movieId) async {
    emit(MediaDetailsLoading());
    final path = "${mediaPath.basePath}${Paths.creditsPath(movieId)}";
    final result = await mediaRepo.getMediaCredits(path);
    result.fold((failure){
      emit(MediaDetailsError(failure.message));
    },(creditsResult) {
      credits = creditsResult;
      credits.removeAllCrewsButDirector();
      emit(MediaDetailsSuccess());
    });

  }

  Future getMediaVideos(int movieId) async {
    emit(MediaDetailsLoading());
    final path = "${mediaPath.basePath}${Paths.videosPath(movieId)}";
    final result = await mediaRepo.getMediaVideo(path);
    result.fold((failure){
      emit(MediaDetailsError(failure.message));
    },(videosResults) {
      videos.addAll(videosResults);
      trailers.addAll(getTrailers(videos));
      emit(MediaDetailsSuccess());
    });

  }

  List<MediaVideo> getTrailers(List<MediaVideo> videos) {
    final trailers = videos.where((e) => e.type.toLowerCase().contains("trailer")).toList();
    return trailers;
  }
  // Future getImageColor(String imagePath) async {
  //   emit(MovieDetailsLoading());
  //   final image = Image.network(AppFunctions.getNetworkImagePath(imagePath));
  //   imageColor = await AppFunctions.getImagePalette(image.image);
  //   emit(MovieDetailsSuccess());
  // }

  // Future<ui.Image> _loadUiImage(String url) async {
  //   final completer = Completer<ui.Image>();
  //   final img = NetworkImage(url);
  //   img.resolve(const ImageConfiguration()).addListener(
  //         ImageStreamListener((ImageInfo info, bool _) {
  //               return completer.complete(info.image);
  //         })
  //   );
  //   return completer.future;
  // }

}