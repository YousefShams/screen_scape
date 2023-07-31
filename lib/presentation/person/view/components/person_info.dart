import 'package:flutter/material.dart';
import 'package:screen_scape/app/components/page_title.dart';
import 'package:screen_scape/app/resources/app_values.dart';

class PersonInfo extends StatelessWidget {
  final String name;
  final String department;
  const PersonInfo({Key? key, required this.name, required this.department}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom : AppPadding.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PageTitle(title: name),
          Text(department, style: Theme.of(context).textTheme.labelLarge)
      ]
    )
    );
  }
}
