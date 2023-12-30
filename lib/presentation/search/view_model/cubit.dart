import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/domain/models/search_results.dart';
import 'package:screen_scape/domain/use_cases/media_search_use_case.dart';
import 'package:screen_scape/presentation/search/view_model/states.dart';


class SearchCubit extends Cubit<SearchState> {
  final GetMediaSearchUseCase searchUC;
  SearchCubit(this.searchUC) : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  //VARIABLES
  SearchResults results = SearchResults([], []);
  final controller = TextEditingController();
  final focusNode = FocusNode();

  //EVENTS
  Future search() async {
    final searchText = controller.text.toLowerCase().trim();
    results.clear();
    if(searchText.isNotEmpty) {
      await getSearchPages(3, searchText);
    }
  }

  Future getSearchPages(int pages, String searchText) async {
    emit(SearchLoading());
    for(int pageNumber = 1 ; pageNumber <= 3 ; pageNumber++) {
      final inputs = GetMediaSearchUseCaseInputs(searchText, pageNumber);
      final searchResults = await searchUC.execute(inputs);
      searchResults.fold(
          (failure){
            emit(SearchError(failure.message));
          },

          (searchResults) {
            results.update(searchResults);
            emit(SearchSuccess());
          }
      );
    }
  }

}