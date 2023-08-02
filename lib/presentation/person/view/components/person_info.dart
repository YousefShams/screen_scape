import 'package:flutter/material.dart';
import 'package:screen_scape/app/components/page_title.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_details_info.dart';

class PersonInfo extends StatelessWidget {
  final String name;
  final String department;
  final String birthDate;
  final String location;
  const PersonInfo({Key? key, required this.name, required this.department, required this.birthDate, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom : AppPadding.pagePadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PageTitle(title: name, paddingFactor: 0.5, extraTopPadding: false,),
                  Text(department, style: Theme.of(context).textTheme.labelLarge)
                ]
            ),
          ),
          const SizedBox(height: 10),
          MovieDetailsInfo(info: birthDate, icon: Icons.calendar_month_rounded),
          MovieDetailsInfo(info: location, icon: Icons.location_history_rounded),
        ],
      ),
    );
  }
}
