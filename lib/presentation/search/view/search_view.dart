import 'package:flutter/material.dart';
import 'package:screen_scape/app/components/page_title.dart';
import 'package:screen_scape/app/resources/app_strings.dart';
import 'package:screen_scape/presentation/search/view/components/search_cubit_widget.dart';
import 'package:screen_scape/presentation/search/view/components/search_results_grid.dart';
import '../../../app/components/bottom_nav.dart';
import 'components/search_text_field.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchCubitWidget(
      builder: (cubit) => Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        bottomNavigationBar: const DefaultBottomNavBar(currentIndex: 2),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageTitle(title: AppStrings.searchTitle, paddingFactor: 3,),
            SearchTextField(controller: cubit.controller, onComplete : cubit.search),
            SearchResultsGrid(results: cubit.results)
          ],
        ),
      ),
    );
  }
}

