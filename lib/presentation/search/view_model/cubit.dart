import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/domain/models/search_results.dart';
import 'package:screen_scape/presentation/search/view_model/states.dart';

import '../../../data/repositories/media_repository.dart';
import '../../../domain/models/media.dart';


class SearchCubit extends Cubit<SearchState> {
  final MediaRepository mediaRepo;
  SearchCubit(this.mediaRepo) : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  //VARIABLES
  SearchResults results = const SearchResults([], []);
  final controller = TextEditingController();

  //EVENTS
  Future search() async {
    final searchText = controller.text.toLowerCase().trim();
    if(searchText.isNotEmpty) {
      emit(SearchLoading());
      final searchResults = await mediaRepo.getSearchedMedia(searchText);
      searchResults.fold(
        (failure){
          emit(SearchError(failure.message));
        },
        (searchResults) {
           results = searchResults;
           emit(SearchSuccess());
        }
      );
    }
  }

}