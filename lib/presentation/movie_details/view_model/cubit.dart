import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/app/functions/functions.dart';
import 'package:screen_scape/app/resources/app_databases_keys.dart';
import 'package:screen_scape/app/resources/app_strings.dart';
import 'package:screen_scape/data/paths/movie_paths.dart';
import 'package:screen_scape/data/paths/paths.dart';
import 'package:screen_scape/data/paths/tv_show_paths.dart';
import 'package:screen_scape/domain/models/member_credits.dart';
import 'package:screen_scape/domain/models/media_video.dart';
import 'package:screen_scape/presentation/movie_details/view_model/states.dart';
import '../../../data/apis/local/local_api.dart';
import '../../../data/repositories/media_repository.dart';
import '../../../domain/models/media.dart';


class MediaDetailsCubit extends Cubit<MediaDetailsState> {
  final MediaRepository mediaRepo;
  final LocalApi localApi;
  MediaDetailsCubit(this.mediaRepo, this.localApi) : super(MediaDetailsInitial());

  static MediaDetailsCubit get(context) => BlocProvider.of(context);

  //VARIABLES
  List<String> imagesPaths = [];

  List<MediaVideo> otherVideos = [];
  List<MediaVideo> trailers = [];
  List<MediaVideo> allVideos = [];

  late Uint8List mainImageBytes;
  late MemberCredits credits;
  late String basePath;
  late bool bookmarked;
  bool inFullScreen = false;

  //EVENTS
  void getMediaDetails(Media media) async {
    basePath = getBasePath(media);
    await getMainNetworkImageBytes(media.imgPath);
    await getMediaImages(media.id);
    await getMediaCredits(media.id);
    await getMediaVideos(media.id);
    bookmarked = getBookmarkStatus(media.id);
  }

  Future getMediaImages(int movieId) async {
    emit(MediaDetailsLoading());
    final path = "$basePath${Paths.imagesPath(movieId)}";
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
    final path = "$basePath${Paths.creditsPath(movieId)}";
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
    final path = "$basePath${Paths.videosPath(movieId)}";
    final result = await mediaRepo.getMediaVideo(path);
    result.fold((failure){
      emit(MediaDetailsError(failure.message));
    },(videosResults) {
      otherVideos.addAll(getOtherVideos(videosResults));
      trailers.addAll(getTrailers(videosResults));
      allVideos = [...trailers, ...otherVideos];
      emit(MediaDetailsSuccess());
    });

  }


  List<MediaVideo> getTrailers(List<MediaVideo> videos) {
    final trailers = videos.where((e) => e.type.toLowerCase().contains("trailer")).toList();
    return trailers;
  }

  List<MediaVideo> getOtherVideos(List<MediaVideo> videos) {
    final trailers = videos.where((e) => !e.type.toLowerCase().contains("trailer")).toList();
    return trailers;
  }

  bool getBookmarkStatus(int id) {
    final result = localApi.get(AppDatabasesKeys.watchlistDatabase, "$id");
    return result!=null;
  }

  Future getMainNetworkImageBytes(String? path) async {

    emit(MediaDetailsLoading());
    try {
      final fullPath = AppFunctions.getNetworkImagePath(path,max: true);

      final bytes = await AppFunctions.getNetworkImageBytes(fullPath, true);

      mainImageBytes =  bytes;

      emit(MediaDetailsSuccess());
    }

    catch(e) {
      emit(MediaDetailsError(AppStrings.connectionError));
    }
  }

  Future toggleOnWatchlist(Media media) async {
    try {
      if(!bookmarked) {
        await localApi.save(AppDatabasesKeys.watchlistDatabase,
            {"${media.id}": media.toJson()});
        final text = "${media.name} ${AppStrings.watchlistSuccessAdd}";
        AppFunctions.showToastMessage(text, isSuccess: true);
      }
      else {
        localApi.delete(AppDatabasesKeys.watchlistDatabase, "${media.id}");
        final text = "${media.name} ${AppStrings.watchlistSuccessRemove}";
        AppFunctions.showToastMessage(text, isSuccess: true);
      }
      bookmarked = !bookmarked;
      emit(MediaDetailsSuccess());
    }
    catch(e) {
      debugPrint(e.toString());
    }
  }

  String getBasePath(Media media) {
    if(media.type == 1) return TVShowPaths().basePath;
    return MoviesPaths().basePath;
  }


  void setIsInFullscreen(bool value) {
    inFullScreen = value;
    emit(MediaDetailsSuccess());
  }
}