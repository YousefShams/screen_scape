import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import 'package:screen_scape/presentation/search/view_model/cubit.dart';

import '../../../../app/resources/app_assets.dart';
import '../../../../app/resources/app_strings.dart';
import '../../../../app/resources/app_values.dart';


class SearchInfoScreen extends StatelessWidget {
  const SearchInfoScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () { SearchCubit.get(context).focusNode.nextFocus(); },
              child: Lottie.asset(AppAssets.search, width: context.getWidth()/1.1),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal:AppPadding.pagePadding),
                child: Text(AppStrings.searchEmpty, textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium))
          ],
        ),
      ),
    );
  }
}