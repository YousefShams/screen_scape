import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/app/components/error_screen.dart';
import 'package:screen_scape/data/paths/current_path.dart';
import 'package:screen_scape/data/repositories/media_repository.dart';
import 'package:screen_scape/domain/models/movies_list_model.dart';
import 'package:screen_scape/domain/use_cases/media_genres_use_case.dart';
import '../../../../data/apis/local/local_api.dart';
import '../../../../data/apis/remote/remote_api.dart';
import '../../../../data/datasources/media_datasource.dart';
import '../../../../domain/use_cases/media_list_use_case.dart';
import '../../view_model/cubit.dart';
import '../../view_model/states.dart';



class MoviesListCubitWidget extends StatelessWidget {
  final Function(MoviesListCubit cubit, MoviesListState state) builder;
  final MoviesListData moviesData;
  const MoviesListCubitWidget({Key? key, required this.builder, required this.moviesData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ds = MediaDatasource(RemoteApi(),LocalApi());
    final repo = MediaRepository(ds, CurrentEntity.getCurrentEntityMapper());
    return BlocProvider(
      create: (_) => MoviesListCubit(GetMediaListUseCase(repo),
      GetMediaGenresUseCase(repo))..init(moviesData),
      child: BlocBuilder<MoviesListCubit,MoviesListState>(
          builder: (context, state) {
            if(state is MoviesListError) {
              return ErrorScreen(message: state.message);
            }
            else {
              return builder(MoviesListCubit.get(context), state);
            }
          }
      ),
    );
  }
}
