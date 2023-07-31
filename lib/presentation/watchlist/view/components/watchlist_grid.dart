import 'package:flutter/material.dart';
import 'package:screen_scape/app/components/error_screen.dart';
import 'package:screen_scape/app/components/media_grid_view.dart';
import 'package:screen_scape/app/resources/app_strings.dart';

import '../../../../app/components/info_screen.dart';
import '../../../../app/resources/app_assets.dart';
import '../../../../domain/models/media.dart';


class WatchlistGrid extends StatelessWidget {
  final List<Media> results;
  final Function onAfterPopping;
  const WatchlistGrid({Key? key, required this.results, required this.onAfterPopping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return results.isNotEmpty ?
    MediaGridView(movies: results, onAfterPopping: onAfterPopping,) :
    const Center(
        child: InfoScreen(message: AppStrings.watchlistEmpty, appAsset: AppAssets.watchlist,)
    );
  }
}
