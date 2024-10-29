import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:news_app/shared/shared_widget/bottom_sheet_button.dart';
import 'package:news_app/src/select_country/presentation/providers/countries_notifer.dart';
import 'package:news_app/src/select_country/presentation/providers/countries_state.dart';

import 'package:responsive_sizer/responsive_sizer.dart';


import 'package:auto_route/auto_route.dart';
@RoutePage()
class SelectCountryScreen extends ConsumerWidget {
  const SelectCountryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CountriesNotifier notifier = ref.read(countriesNotifierProvider.notifier);
    CountriesState state = ref.watch(countriesNotifierProvider);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Select your country',
              style: Theme.of(context).textTheme.titleMedium),
        ),
        body: /*
        notifier.countries.isEmpty
            ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ))
            :*/
            Padding(
          padding:
              EdgeInsets.only(left: 5.w, right: 5.w, top: 1.h, bottom: 12.h),
          child: Column(
            children: [
              SearchBar(
                hintText: 'Search ',
                onChanged: (value) {
                  notifier.searchCountry(value);
                },
                trailing: List.filled(
                    1,
                    Image.asset(
                      AppAssets.iconSearch,
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColors.lightPurpleColor
                          : AppColors.lightGreyColor,
                    ),
                    growable: true),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: notifier.countries.length,
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        notifier.selectCountry(index);
                        print('index $index');

                        print('name ${notifier.countries[index].countryName}');
                        print(
                            "isCountrySelected ${notifier.countries[index].isSelected}   id: ${notifier.countries[index].id}");
                        /* print(
                                  notifier.countries[index].id,
                                );*/
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      selected: notifier.countries[index].isSelected,
                      selectedTileColor: notifier.countries[index].isSelected
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      leading: Image.network(
                        notifier.countries[index].countryFlag,
                        height: 40,
                        width: 40,
                      ),
                      title: Text(
                        notifier.countries[index].countryName,
                        style: notifier.countries[index].isSelected
                            ? Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.white)
                            : Theme.of(context).textTheme.labelLarge,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomSheet: BottomSheetButton(
          onPressed: () {
            if (CountriesNotifier.selectedCountryId != 0) {
              appRouter.push(const ChooseYourTopicsRoute());

            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Please select your country'),
              ));
            }
          },
        ));
  }
}
