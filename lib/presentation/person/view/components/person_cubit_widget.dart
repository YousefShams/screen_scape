import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/app/components/error_screen.dart';
import 'package:screen_scape/app/components/loading_screen.dart';
import 'package:screen_scape/data/apis/local/local_api.dart';
import 'package:screen_scape/data/apis/remote/remote_api.dart';
import 'package:screen_scape/data/datasources/media_datasource.dart';
import 'package:screen_scape/data/paths/current_path.dart';
import 'package:screen_scape/data/repositories/media_repository.dart';

import '../../view_model/cubit.dart';
import '../../view_model/states.dart';




class PersonCubitWidget extends StatelessWidget {
  final Function(PersonCubit cubit) builder;
  final int id;
  const PersonCubitWidget({Key? key, required this.builder, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapper = CurrentEntity.getCurrentEntityMapper();
    final repo = MediaRepository(MediaDatasource(RemoteApi()), mapper);
    return BlocProvider(
      create: (_) => PersonCubit(repo)..getPerson(id),
      child: BlocBuilder<PersonCubit,PersonState>(
          builder: (context, state) {
            if(state is PersonLoading) {
              return const LoadingScreen();
            }
            else if(state is PersonError) {
              return ErrorScreen(message: state.message);
            }
            else {
              return builder(PersonCubit.get(context));
            }
          }
      ),
    );
  }
}
