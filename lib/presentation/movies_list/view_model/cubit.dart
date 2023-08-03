import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/domain/models/movies_list_model.dart';
import 'package:screen_scape/presentation/movies_list/view_model/states.dart';
import '../../../domain/models/media.dart';
import '../../../domain/use_cases/media_genres_use_case.dart';
import '../../../domain/use_cases/media_list_use_case.dart';


class MoviesListCubit extends Cubit<MoviesListState> {
  final GetMediaListUseCase mediaListUC;
  final GetMediaGenresUseCase mediaGenresUC;

  MoviesListCubit(this.mediaListUC, this.mediaGenresUC) : super(MoviesListInitial());

  static MoviesListCubit get(context) => BlocProvider.of(context);

  //VARIABLES
  final controller = ScrollController();
  int currentPage = 1;
  List<Media> media = [];
  late MoviesListData data;
  late bool isGenre;
  DateTime lastGet = DateTime.now();

  //EVENTS
  void init(MoviesListData moviesData) async {

    data = moviesData;
    isGenre = data.genreId != null;
    media.addAll(data.movies);

    emit(MoviesListSuccess());

    controller.addListener(() async {

      final maxDistance = controller.position.maxScrollExtent- controller.position.minScrollExtent;
      final currentDistance = controller.position.maxScrollExtent - controller.position.pixels;

      if(currentDistance/maxDistance < 0.4 &&
          DateTime.now().difference(lastGet).inSeconds > 2) {
        lastGet = DateTime.now();
        if(isGenre) {
          await _getMediaOfGenre(data.path, data.genreId!, page: currentPage+1);
        }
        else {
          await _getMediaList(data.path, page: currentPage+1);
        }

      }
    });
  }


  Future _getMediaList(String listPath, {int page = 1}) async {
    emit(MoviesListLoading());
    final inputs = GetMediaListUseCaseInputs(listPath, page);
    final result = await mediaListUC.execute(inputs);
    result.fold((failure) {
      emit(MoviesListError(failure.message));
    }, (mediaResults) {
      media.addAll(mediaResults);
      currentPage++;
      emit(MoviesListSuccess());
    }
    );
  }

  Future _getMediaOfGenre(String listPath, int id,  {int page = 1}) async {
    emit(MoviesListLoading());
    final inputs = GetMediaGenresUseCaseInputs(listPath, [id], page);
    final result = await mediaGenresUC.execute(inputs);
    result.fold((failure) {
      emit(MoviesListError(failure.message));
    }, (mediaResults) {
      media.addAll(mediaResults.first);
      currentPage++;
      emit(MoviesListSuccess());
    }
    );
  }

}