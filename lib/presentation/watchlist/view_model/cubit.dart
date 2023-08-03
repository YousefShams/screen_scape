import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/domain/use_cases/media_watchlist_use_case.dart';
import 'package:screen_scape/presentation/watchlist/view_model/states.dart';
import '../../../domain/models/media.dart';


class WatchlistCubit extends Cubit<WatchlistState> {
  final GetMediaWatchlistUseCase watchlistUC;
  WatchlistCubit(this.watchlistUC) : super(WatchlistInitial());

  static WatchlistCubit get(context) => BlocProvider.of(context);

  //VARIABLES
  List<Media> media = [];

  //EVENTS
  void getLocalMedia() async {
    emit(WatchlistLoading());
    final result = await watchlistUC.execute(null);
    result.fold(
      (l) => emit(WatchlistError(l.message)),
      (watchlist) {
        media = watchlist.toList();
        emit(WatchlistSuccess());
      }
    );
  }


}