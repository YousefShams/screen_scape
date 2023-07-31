import 'package:flutter/material.dart';

import '../../../../app/resources/app_fonts.dart';
import '../../../../app/resources/app_strings.dart';
import '../../../../app/resources/app_values.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function onComplete;
  const SearchTextField({super.key, required this.controller, required this.onComplete,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        controller: controller,
        onFieldSubmitted: (_) { onComplete(); },
        style: AppFonts.getRegularStyle(),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search_rounded, color: Colors.black87,),
          hintText: AppStrings.searchHint,
        ),
      ),
    );
  }
}
