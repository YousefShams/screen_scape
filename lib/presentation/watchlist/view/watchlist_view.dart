import 'package:flutter/material.dart';
import 'package:screen_scape/app/components/page_title.dart';
import 'package:screen_scape/app/resources/app_strings.dart';
import '../../../app/components/bottom_nav.dart';
import 'components/watchlist_cubit_widget.dart';
import 'components/watchlist_grid.dart';


class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WatchlistCubitWidget(
      builder: (cubit) => Scaffold(
        bottomNavigationBar: const DefaultBottomNavBar(currentIndex: 3),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageTitle(title: AppStrings.watchlistTitle),
            WatchlistGrid(results: cubit.media, onAfterPopping: cubit.getLocalMedia,),
          ],
        ),
      ),
    );
  }
}

