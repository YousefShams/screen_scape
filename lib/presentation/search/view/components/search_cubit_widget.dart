import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/app/components/error_screen.dart';
import 'package:screen_scape/app/components/loading_screen.dart';
import 'package:screen_scape/data/paths/current_path.dart';
import 'package:screen_scape/data/repositories/media_repository.dart';
import '../../../../data/apis/remote/remote_api.dart';
import '../../../../data/datasources/media_datasource.dart';
import '../../../../domain/models/media.dart';
import '../../view_model/cubit.dart';
import '../../view_model/states.dart';



class SearchCubitWidget extends StatelessWidget {
  final Function(SearchCubit cubit) builder;
  const SearchCubitWidget({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ds = MediaDatasource(RemoteApi());
    final repo = MediaRepository(ds, CurrentEntity.getCurrentEntityMapper());
    return BlocProvider(
      create: (_) => SearchCubit(repo),
      child: BlocBuilder<SearchCubit,SearchState>(
          builder: (context, state) {
            if(state is SearchLoading) {
              return const LoadingScreen();
            }
            else if(state is SearchError) {
              return ErrorScreen(message: state.message);
            }
            else {
              return builder(SearchCubit.get(context));
            }
          }
      ),
    );
  }
}
