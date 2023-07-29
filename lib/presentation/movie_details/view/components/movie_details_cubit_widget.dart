import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/app/components/error_screen.dart';
import 'package:screen_scape/app/components/loading_screen.dart';
import 'package:screen_scape/data/repositories/movies_repository.dart';

import '../../../../domain/models/movie.dart';
import '../../view_model/cubit.dart';
import '../../view_model/states.dart';



class MovieDetailsCubitWidget extends StatelessWidget {
  final Function(MovieDetailsCubit cubit) builder;
  final Movie movie;
  const MovieDetailsCubitWidget({Key? key, required this.builder, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieDetailsCubit(MoviesRepository())..getMovieDetails(movie),
      child: BlocBuilder<MovieDetailsCubit,MovieDetailsState>(
          builder: (context, state) {
            if(state is MovieDetailsLoading) {
              return const LoadingScreen();
            }
            else if(state is MovieDetailsError) {
              return ErrorScreen(message: state.message);
            }
            else {
              return builder(MovieDetailsCubit.get(context));
            }
          }
      ),
    );
  }
}
