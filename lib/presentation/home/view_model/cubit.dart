import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/app/constants/constants.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import 'package:screen_scape/app/resources/app_colors.dart';
import 'package:screen_scape/app/resources/app_routes.dart';
import 'package:screen_scape/data/mapper/mapper.dart';
import 'package:screen_scape/data/paths/current_path.dart';
import 'package:screen_scape/data/paths/paths.dart';
import 'package:screen_scape/data/paths/tv_show_paths.dart';
import 'package:screen_scape/data/repositories/media_repository.dart';
import 'package:screen_scape/presentation/home/view_model/states.dart';
import '../../../data/paths/movie_paths.dart';
import '../../../domain/models/media.dart';


class HomeCubit extends Cubit<HomeState> {
  final MediaRepository mediaRepo;
  final Paths paths;
  HomeCubit(this.mediaRepo, this.paths) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  //VARIABLES
  List<Media> nowPlayingMedia = [];
  List<Media> topRatedMedia = [];
  List<List<Media>> genresMedia = [];
  List<Color> nowPlayingColors = [];
  static const viewportFraction = 0.5;
  int topRatedPage = 1;
  final pageController = PageController(viewportFraction: viewportFraction);
  double currentMediaIndex = 0;
  late int currentIndex;



  //EVENTS
  void getMediaLists() async {
    currentIndex = paths is MoviesPaths ? 0 : 1;
    final nowPlayingMoviesPage = await _getMediaList("${paths.basePath}${paths.topPath}");
    nowPlayingMedia.addAll(List<Media>.from(nowPlayingMoviesPage));
    nowPlayingMedia.sort((a,b)=> b.releaseDate.getDateTime().millisecondsSinceEpoch
        .compareTo(a.releaseDate.getDateTime().millisecondsSinceEpoch));
    nowPlayingColors = getColors(nowPlayingMedia.length);
    topRatedMedia = List<Media>.from(await _getMediaList("${paths.basePath}${Paths.topRatedPath}"));
    genresMedia = List<List<Media>>.from(await _getMediaOfGenres());
  }

  Future<List<Media>> _getMediaList(String listPath, {int page = 1}) async {
    emit(HomeLoadingState());
    List<Media> mediaResult = [];
    final result = await mediaRepo.getMediaList(listPath, page: page);
    result.fold((failure) {
      emit(HomeErrorState(failure.message));
    }, (media) {
      mediaResult.addAll(media);
      emit(HomeSuccessState());
    }
    );
    return mediaResult.toList();
  }

  Future<List<List<Media>>> _getMediaOfGenres() async {
    emit(HomeLoadingState());
    final result = await mediaRepo.getMediaOfGenres(
        Paths.discoverPath(paths.basePath), AppConstants.appViewGenres);

    List<List<Media>> mediaLists = [];

    result.fold((failure) {
      emit(HomeErrorState(failure.message));
    }, (moviesGenresLists) {
      mediaLists.addAll(moviesGenresLists);
      emit(HomeSuccessState());
    }
    );
    return mediaLists;
  }

  Future showMoreTopRated() async {
    try {
      emit(HomeLoadingState());
      final results = await _getMediaList("${paths.basePath}"
          "${Paths.topRatedPath}", page: topRatedPage+1);
      topRatedMedia.addAll(results);
      emit(HomeSuccessState());

    }
    catch(e) {
      debugPrint(e.toString());
      emit(HomeErrorState(e.toString()));
    }
  }

  List<Color> getColors(int length) {
    return List.generate(length, (index) => AppColors.getRandomColor());
  }

  void carouselPositionListen(BuildContext context) {
    final itemWidth = context.getWidth() * viewportFraction;
    pageController.addListener(() {
      currentMediaIndex = ((pageController.offset/itemWidth)-0.2).ceil().toDouble();
      emit(HomeUpdateState());
    });
  }


  double getScale(int index) {
    if(currentMediaIndex == index) {
      return 1;
    }
    else {
      return 0.85;
    }
  }

}