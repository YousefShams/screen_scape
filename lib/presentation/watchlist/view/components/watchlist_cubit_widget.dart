import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/app/components/error_screen.dart';
import 'package:screen_scape/app/components/loading_screen.dart';
import 'package:screen_scape/data/apis/local/local_api.dart';
import 'package:screen_scape/domain/use_cases/media_watchlist_use_case.dart';
import '../../../../data/apis/remote/remote_api.dart';
import '../../../../data/datasources/media_datasource.dart';
import '../../../../data/paths/current_path.dart';
import '../../../../data/repositories/media_repository.dart';
import '../../view_model/cubit.dart';
import '../../view_model/states.dart';



class WatchlistCubitWidget extends StatelessWidget {
  final Function(WatchlistCubit cubit) builder;
  const WatchlistCubitWidget({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ds = MediaDatasource(RemoteApi(),LocalApi());
    final repo = MediaRepository(ds, CurrentEntity.getCurrentEntityMapper());

    return BlocProvider(
      create: (_) => WatchlistCubit(GetMediaWatchlistUseCase(repo))
        ..getLocalMedia(),
      child: BlocBuilder<WatchlistCubit,WatchlistState>(
          builder: (context, state) {
            if(state is WatchlistLoading) {
              return const LoadingScreen();
            }
            else if(state is WatchlistError) {
              return ErrorScreen(message: state.message);
            }
            else {
              return builder(WatchlistCubit.get(context));
            }
          }
      ),
    );
  }
}
