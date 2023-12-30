import 'package:flutter/material.dart';
import 'package:screen_scape/app/components/media_grid_view.dart';
import 'package:screen_scape/app/components/page_title.dart';
import 'package:screen_scape/domain/models/search_results.dart';
import 'package:screen_scape/presentation/search/view/components/search_info.dart';
import 'package:screen_scape/presentation/search/view/components/search_persons.dart';


class SearchResultsGrid extends StatelessWidget {
  final SearchResults results;
  const SearchResultsGrid({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (results.persons.isNotEmpty || results.media.isNotEmpty) {
      return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Visibility(
                  visible: results.persons.isNotEmpty,
                  child: SearchPersonsList(persons: results.persons)),

              Visibility(
                  visible: results.media.isNotEmpty && results.persons.isNotEmpty,
                child: const PageTitle(title: "Movies, TV-Shows", extraTopPadding: false,
              ),
              ),
              Visibility(
                visible: results.media.isNotEmpty,
                child: MediaGridView(movies: results.media),
              ),
          ]
        )
        );
    } else {
      return const SearchInfoScreen();
    }
  }
}
