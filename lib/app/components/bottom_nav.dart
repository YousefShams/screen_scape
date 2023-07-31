import 'dart:math';
import 'package:flutter/material.dart';
import 'package:screen_scape/app/functions/functions.dart';


class DefaultBottomNavBar extends StatelessWidget {
  final int currentIndex;
  const DefaultBottomNavBar({Key? key, required this.currentIndex}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index){
        AppFunctions.updateCurrent(index, currentIndex, context);
        AppFunctions.navigate(index, currentIndex, context);
      },
      items: [
        const BottomNavigationBarItem(
          label: "movies",
          icon: Icon(Icons.local_movies_rounded),
        ),
        BottomNavigationBarItem(
          label: "tv",
          icon: Transform.rotate(
            angle: -pi* 15,
            child: const Icon(Icons.live_tv_rounded)
          ),
        ),
        const BottomNavigationBarItem(
          label: "search",
          icon: Icon(Icons.search_rounded),
        ),
        const BottomNavigationBarItem(
          label: "watchlist",
          icon: Icon(Icons.bookmarks_rounded),
        )

      ],
    );
  }

}
