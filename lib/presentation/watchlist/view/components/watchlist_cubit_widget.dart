import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/app/components/error_screen.dart';
import 'package:screen_scape/app/components/loading_screen.dart';
import 'package:screen_scape/data/apis/local/local_api.dart';
import '../../view_model/cubit.dart';
import '../../view_model/states.dart';



class WatchlistCubitWidget extends StatelessWidget {
  final Function(WatchlistCubit cubit) builder;
  const WatchlistCubitWidget({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WatchlistCubit(LocalApi())..getLocalMedia(),
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
