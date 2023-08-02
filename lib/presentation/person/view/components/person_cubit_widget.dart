import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/app/components/error_screen.dart';
import 'package:screen_scape/app/components/loading_screen.dart';
import '../../../../app/services/states.dart';
import '../../view_model/cubit.dart';




class PersonCubitWidget<C extends Cubit<S>, S , LS extends S, ES extends ErrorState>
    extends StatelessWidget {

  final Function(PersonCubit cubit) builder;
  final C cubit;
  const PersonCubitWidget({Key? key, required this.builder, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final mapper = CurrentEntity.getCurrentEntityMapper();
    // final repo = MediaRepository(MediaDatasource(RemoteApi()), mapper);
    return BlocProvider(
      create: (_) => cubit,
      child: BlocBuilder<C,S>(
          builder: (context, state) {
            if(state is LS) {
              return const LoadingScreen();
            }
            else if(state is ES) {
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
