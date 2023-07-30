import 'package:flutter/material.dart';
import 'package:screen_scape/domain/models/credits.dart';

import 'movie_details_cast_item.dart';


class MovieCreditsList extends StatelessWidget {
  final Credits credits;
  const MovieCreditsList({Key? key, required this.credits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210, width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: credits.cast.length,
        itemBuilder: (context,index) {
          if(index == 0) {
            if(credits.crew.isNotEmpty) {
              final item =credits.crew.first;
              return MovieCreditsItem(imagePath: item.imagePath,
                  name: item.name, role: item.job);
            }
            else { return const SizedBox.shrink(); }

          }
          else {
            final item =credits.cast[index-1];
            return MovieCreditsItem(imagePath: item.imagePath,
                name: item.name, role: item.character);
          }
        },
      ),
    );
  }
}
