import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_colors.dart';
import 'package:screen_scape/app/resources/app_routes.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import 'package:screen_scape/domain/models/media_member.dart';

import '../../../../app/components/page_title.dart';
import '../../../../app/functions/functions.dart';

class SearchPersonsList extends StatelessWidget {
  final List<MediaMember> persons;
  const SearchPersonsList({Key? key, required this.persons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      trailing: const Padding(
        padding: EdgeInsets.only(top: 10, right: AppPadding.pagePadding),
        child: Icon(Icons.menu, color: AppColors.primaryColor,),
      ),
      title:  const PageTitle(title: "People", extraTopPadding: false,),
      children: [SizedBox(
        height: 170,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: persons.length,
          itemBuilder: (context,index)=>
              Padding(
                padding: const EdgeInsets.only(left: AppPadding.pagePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){Navigator.pushNamed(context, AppRoutes.personRoute, arguments: persons[index].id);},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          AppFunctions.getNetworkImagePath(persons[index].imagePath),
                          fit: BoxFit.cover,
                          width: 130, height: 130,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(persons[index].name, maxLines: 2, overflow: TextOverflow.fade,
                        style: Theme.of(context).textTheme.labelLarge),
                  ],
                ),
              ),
        ),
      )],
    );
  }
}
