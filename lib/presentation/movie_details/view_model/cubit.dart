import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/app/functions/functions.dart';
import 'package:screen_scape/app/resources/app_colors.dart';
import 'package:screen_scape/domain/models/credits.dart';
import 'package:screen_scape/presentation/movie_details/view_model/states.dart';
import '../../../data/repositories/movies_repository.dart';
import '../../../domain/models/movie.dart';
import 'dart:ui' as ui;


class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MoviesRepository moviesRepo;
  MovieDetailsCubit(this.moviesRepo) : super(MovieDetailsInitial());

  static MovieDetailsCubit get(context) => BlocProvider.of(context);

  //VARIABLES
  List<String> imagesPaths = [];
  //late Color imageColor;
  late Credits credits;

  //EVENTS
  void getMovieDetails(Movie movie) async {
    await getMovieImages(movie.id);
    await getMovieCredits(movie.id);
    //await getImageColor(movie.imgPath);
  }

  Future getMovieImages(int movieId) async {
    emit(MovieDetailsLoading());
    final result = await moviesRepo.getMovieImages(movieId);
    result.fold((failure){
      emit(MovieDetailsError(failure.message));
    },(resultPaths) {
      imagesPaths.addAll(resultPaths);
      emit(MovieDetailsSuccess());
    });
  }

  Future getMovieCredits(int movieId) async {
    emit(MovieDetailsLoading());
    final result = await moviesRepo.getMovieCredits(movieId);
    result.fold((failure){
      emit(MovieDetailsError(failure.message));
    },(creditsResult) {
      credits = creditsResult;
      credits.removeAllCrewsButDirector();
      emit(MovieDetailsSuccess());
    });

  }

  // Future getImageColor(String imagePath) async {
  //   emit(MovieDetailsLoading());
  //   final image = Image.network(AppFunctions.getNetworkImagePath(imagePath));
  //   imageColor = await AppFunctions.getImagePalette(image.image);
  //   emit(MovieDetailsSuccess());
  // }

  Future<ui.Image> _loadUiImage(String url) async {
    final completer = Completer<ui.Image>();
    final img = NetworkImage(url);
    img.resolve(const ImageConfiguration()).addListener(
          ImageStreamListener((ImageInfo info, bool _) {
                return completer.complete(info.image);
          })
    );
    return completer.future;
  }

}