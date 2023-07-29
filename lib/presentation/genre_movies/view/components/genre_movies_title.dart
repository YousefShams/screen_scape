import 'package:flutter/material.dart';

import '../../../../app/components/page_title.dart';
import '../../../../app/functions/functions.dart';

class GenreMoviesTitle extends StatelessWidget {
  final String title;
  const GenreMoviesTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTitle(title: "${AppFunctions.capitalizeText(title)} Movies");
  }
}
