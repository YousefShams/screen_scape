import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/app/constants/constants.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import 'package:screen_scape/app/resources/app_colors.dart';
import 'package:screen_scape/presentation/home/view_model/states.dart';
import '../../../data/repositories/movies_repository.dart';
import '../../../domain/models/movie.dart';


class HomeCubit extends Cubit<HomeState> {
  final MoviesRepository moviesRepo;
  HomeCubit(this.moviesRepo) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  //VARIABLES
  List<Movie> nowPlayingMovies = [];
  List<Movie> topRatedMovies = [];
  List<List<Movie>> genresMovies = [];
  List<Movie> genresPopularMovie = [];
  List<Color> nowPlayingColors = [];

  static const viewportFraction = 0.5;
  final pageController = PageController(viewportFraction: viewportFraction);
  double currentIndex = 0;


  //EVENTS
  void getMoviesLists() async {
    final nowPlayingMoviesPage = await _getMoviesList(AppConstants.nowPlayingMoviesPath);
    nowPlayingMovies.addAll(nowPlayingMoviesPage);
    nowPlayingMovies.sort((a,b)=> b.dateTimeMillis.compareTo(a.dateTimeMillis));
    nowPlayingColors = getColors(nowPlayingMovies.length);
    topRatedMovies = await _getMoviesList(AppConstants.topRatedMoviesPath);
    genresMovies = await _getMoviesOfGenres();
    genresPopularMovie = genresMovies.map((e) => e.first).toList();
  }

  Future<List<Movie>> _getMoviesList(String listPath, {int page = 1}) async {
    emit(HomeLoadingState());
    List<Movie> moviesResult = [];
    final result = await moviesRepo.getMoviesList(listPath, page: page);
    result.fold((failure) {
      emit(HomeErrorState(failure.message));
    }, (movies) {
      moviesResult.addAll(movies);
      emit(HomeSuccessState());
    }
    );
    return moviesResult.toList();
  }

  Future<List<List<Movie>>> _getMoviesOfGenres() async {
    emit(HomeLoadingState());
    final result = await moviesRepo.getMoviesOfGenres(
        AppConstants.discoverMoviesPath, AppConstants.appViewGenres);

    List<List<Movie>> moviesLists = [];

    result.fold((failure) {
      emit(HomeErrorState(failure.message));
    }, (moviesGenresLists) {
      moviesLists.addAll(moviesGenresLists);
      emit(HomeSuccessState());
    }
    );
    return moviesLists;
  }
  
  List<Color> getColors(int length) {
    return List.generate(length, (index) => AppColors.getRandomColor());
  }

  void carouselPositionListen(BuildContext context) {
    final itemWidth = context.getWidth() * viewportFraction;
    pageController.addListener(() {
      currentIndex = ((pageController.offset/itemWidth)-0.2).ceil().toDouble();
      emit(HomeUpdateState());
    });
  }


  double getScale(int index) {
    if(currentIndex == index) {
      return 1;
    }
    else {
      return 0.85;
    }
  }

}