import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_colors.dart';
import '../../../../app/resources/app_fonts.dart';
import '../../../../app/resources/app_strings.dart';
import '../../../../app/resources/app_values.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function onComplete;
  final FocusNode focusNode;
  const SearchTextField({super.key, required this.controller, required this.onComplete, required this.focusNode,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppPadding.pagePadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: AppColors.primaryColor.withOpacity(0.6),
            blurRadius: 10, offset: const Offset(3, 5))]
      ),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        controller: controller,
        focusNode: focusNode,
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
