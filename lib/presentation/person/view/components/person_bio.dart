import 'package:flutter/material.dart';
import 'package:screen_scape/app/components/page_title.dart';
import 'package:screen_scape/app/resources/app_colors.dart';
import 'package:screen_scape/app/resources/app_values.dart';

class PersonBio extends StatefulWidget {
  final String bio;
  const PersonBio({Key? key, required this.bio}) : super(key: key);

  @override
  State<PersonBio> createState() => _PersonBioState();
}

class _PersonBioState extends State<PersonBio> {
  bool inReadMore = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { setState(() { inReadMore = !inReadMore; }); },
      child: Padding(
          padding: const EdgeInsets.all(AppPadding.pagePadding),
          child: RichText(text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: (!inReadMore) ? [
              TextSpan(text:
              "${widget.bio.substring(0, widget.bio.length < 200 ? widget.bio.length :200)}.."),
              TextSpan(text: " Read more.." , style: Theme.of(context).textTheme.bodyMedium?.
                copyWith(color: AppColors.primaryColor)
              )
            ] :  [TextSpan(text: widget.bio)]
          )
          )
      ),
    );
  }
}
