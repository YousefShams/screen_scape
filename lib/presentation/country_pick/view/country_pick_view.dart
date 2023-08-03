import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:screen_scape/app/components/page_title.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import 'package:screen_scape/app/functions/functions.dart';
import 'package:screen_scape/app/resources/app_databases_keys.dart';
import 'package:screen_scape/app/resources/app_routes.dart';
import 'package:screen_scape/app/resources/app_strings.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import '../../../data/apis/local/local_api.dart';

class CountryPickScreen extends StatefulWidget {
  const CountryPickScreen({Key? key}) : super(key: key);

  @override
  State<CountryPickScreen> createState() => _CountryPickScreenState();
}

class _CountryPickScreenState extends State<CountryPickScreen> {

  CountryCode? countryCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageTitle(title: AppStrings.countryPick),
            SizedBox(height: context.getHeight()/4),
            Center(
              child: FilledButton.tonal(
                onPressed: (){},
                child: CountryCodePicker(
                  dialogBackgroundColor: Colors.transparent,
                  showFlag: true,
                  showFlagDialog: true,
                  barrierColor: Colors.transparent,
                  initialSelection: CountryCode.fromCountryCode("US").name,
                  onChanged: (country) {
                    setState(() {
                      countryCode = country;
                    });
                  },
                  padding: const EdgeInsets.fromLTRB(20,20,20,20),
                  hideMainText: true,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  showCountryOnly: true,
                  alignLeft: true,
                  flagWidth: 40,
                  boxDecoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            (countryCode!=null) ? Center(
              child: Text(countryCode!.name!,
                  style: Theme.of(context).textTheme.titleLarge
              ),
            ) : const SizedBox.shrink(),
            const Spacer(),
            Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(AppPadding.pagePadding),
                child: FilledButton.tonal(
                   onPressed: () async {
                      if(countryCode!=null) {
                        await LocalApi().save(AppDatabasesKeys.settingsDatabase,
                          {AppDatabasesKeys.iso: countryCode?.code,
                            AppDatabasesKeys.onboardingDone: true
                          }).then((value) => Navigator.pushReplacementNamed(
                            context, AppRoutes.homeRoute));
                      }
                      else {
                        AppFunctions.showToastMessage(AppStrings.countryError);
                      }
                   },
                   child: const Text("   Done   ")
                )
            )
          ],
        ),
      ),
    );
  }
}
