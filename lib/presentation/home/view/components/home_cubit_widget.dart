import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/app/components/error_screen.dart';
import 'package:screen_scape/app/components/loading_screen.dart';
import 'package:screen_scape/data/apis/remote/remote_api.dart';
import 'package:screen_scape/data/datasources/media_datasource.dart';
import 'package:screen_scape/data/paths/current_path.dart';
import 'package:screen_scape/data/repositories/media_repository.dart';
import '../../view_model/cubit.dart';
import '../../view_model/states.dart';



class HomeCubitWidget extends StatelessWidget {
  final Function(HomeCubit cubit) builder;
  const HomeCubitWidget({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ds = MediaDatasource(RemoteApi());
    final repo = MediaRepository(ds, CurrentEntity.getCurrentEntityMapper());
    return BlocProvider(
      create: (_) => HomeCubit(repo, CurrentEntity.getCurrentEntityPath())
        ..getMediaLists()..carouselPositionListen(context),
      child: BlocBuilder<HomeCubit,HomeState>(
          builder: (context, state) {
            if(state is HomeLoadingState) {
              return const LoadingScreen();
            }
            else if(state is HomeErrorState) {
              return ErrorScreen(message: state.message);
            }
            else {
              return builder(HomeCubit.get(context));
            }
          }
      ),
    );
  }
}
