import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/app/resources/app_databases_keys.dart';
import 'package:screen_scape/presentation/watchlist/view_model/states.dart';
import '../../../data/apis/local/local_api.dart';
import '../../../domain/models/media.dart';


class WatchlistCubit extends Cubit<WatchlistState> {
  final LocalApi localApi;
  WatchlistCubit(this.localApi) : super(WatchlistInitial());

  static WatchlistCubit get(context) => BlocProvider.of(context);

  //VARIABLES
  List<Media> media = [];

  //EVENTS
  void getLocalMedia() async {
    try{
      emit(WatchlistLoading());
      const dbName = AppDatabasesKeys.watchlistDatabase;
      final List results = localApi.getAll(dbName);

      media = results.map((e) {
        return Media.fromJson(Map<String,dynamic>.from(e));
      }).toList();

      emit(WatchlistSuccess());
    }
    catch(e) {
      emit(WatchlistSuccess());
    }
  }


}