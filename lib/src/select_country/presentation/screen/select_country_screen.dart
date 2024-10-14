import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/src/select_country/presentation/providers/countries_notifer.dart';
import 'package:news_app/src/select_country/presentation/providers/countries_state.dart';
import 'package:news_app/src/topics/presentation/screen/topics.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../shared/core/theme/app_colors.dart';
import '../../../../shared/shared_widget/bottom_sheet_button.dart';

class SelectCountryScreen extends ConsumerWidget {
   SelectCountryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CountriesNotifier notifier = ref.read(countriesNotifierProvider.notifier);
    CountriesState state = ref.watch(countriesNotifierProvider);

     return Scaffold(
        appBar: AppBar(
          title: Text('Select your country',
              style: Theme.of(context).textTheme.titleMedium),
        ),
        body:/*
        notifier.countries.isEmpty
            ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ))
            :*/
        Padding(
          padding: EdgeInsets.only(left:  5.w,
              right:  5.w,
              top: 1.h,bottom: 12.h),

          child: Column(
            children: [
              SearchBar(
                hintText: 'Search ',
                onChanged: (value) {
                  notifier.searchCountry(value);
                 /* notifier.countries = notifier.countries
                      .where((element) => element.countryName
                      .toLowerCase()
                      .contains(value.toLowerCase()))
                      .toList();*/
                },
                trailing: List.filled(
                    1,
                    Image.asset(
                      AppAssets.iconSearch,
                      color:
                          Theme.of(context).brightness == Brightness.light
                              ? AppColors.lightPurpleColor
                              : AppColors.lightGreyColor,
                    ),
                    growable: true),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: Skeletonizer(
                 enabled: state.isLoading?true:false,
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              selected: notifier.countries[index].isSelected,
                              selectedTileColor:
                                  notifier.countries[index].isSelected
                                      ? AppColors.primaryColor
                                      : Colors.transparent,
                              leading: Image.network(
                                notifier.countries[index].countryFlag,
                                height: 40,
                                width: 40,
                              ),
                              title: Text(
                                notifier.countries[index].countryName,
                                style: notifier.countries[index].isSelected ?Theme.of(context)
                                    .textTheme
                                    .labelLarge?.copyWith(color: Colors.white):Theme.of(context)
                                    .textTheme.labelLarge,
                              ),
                              );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: BottomSheetButton(
          onPressed: () {
       if(CountriesNotifier.selectedCountryId != 0){
         Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (context) =>  const ChooseYourTopics()));
       }
       else
       {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please select your country'),
        ));
       }
          },
        ));
  }
}
