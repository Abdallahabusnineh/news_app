import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/src/fill_profile/presentation/screen/fill_profile.dart';
import 'package:news_app/src/new_sources/presentation/providers/newsource_notifer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../shared/core/theme/app_colors.dart';
import '../../../../shared/shared_widget/bottom_sheet_button.dart';

class NewSources extends ConsumerWidget {
  const NewSources({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // NewSourceNotifier notifier = ref.read(newSourceNotifierProvider.notifier);
    // NewSourceState state = ref.watch(newSourceNotifierProvider);

    var prov = ref.watch(newSourceChangeNotifierProvider);
    var sources = prov.sources;
 /*   var topicsProv =ref.watch(topicsNotifierProvider.notifier);
    var countryProv =ref.watch(countriesNotifierProvider.notifier);*/
    bool isLoading = prov.isLoading;
    bool isSuccess = prov.isSuccess;
    bool isError = prov.isError;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Choose Your New Sources',
        ),
      ),
      body: Container(
          padding:
              EdgeInsets.only(left: 3.w, right: 3.w, top: 1.h, bottom: 15.h)
                  .copyWith(),
          child: Column(
            children: [
              SearchBar(
                hintText: 'Search ',
                trailing: List.filled(
                    1,
                    Image.asset(
                      AppAssets.iconSearch,
                      color: AppColors.lightGreyColor,
                    ),
                    growable: true),
                onChanged: (value) {
                  prov.getSources(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              !isSuccess
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: GridView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: sources.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 2.0.h,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          var item = sources[index];
                          bool isFollowed = prov.youFollow(index);
                          return Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: .5.w, vertical: 1.h),
                            decoration: BoxDecoration(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.grey.shade50
                                  : const Color(0xFF3A3B3C),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? const Color(0xFFEEF1F4)
                                            : const Color(0xFFEEF1F4)
                                                .withOpacity(.32),
                                      ),
                                      child: Image.asset(AppAssets.vector)),
                                ),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Text(
                                  item.userName,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                isFollowed
                                    ? Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 1.w,
                                            vertical: 0.5.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: TextButton(
                                              onPressed: () async {
                                                await prov.follow(index);
                                              },
                                              child: FittedBox(
                                                child: Text(
                                                  'Following',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge
                                                      ?.copyWith(
                                                        color: AppColors
                                                            .whiteColor,
                                                      ),
                                                ),
                                              )),
                                        ),
                                      )
                                    : Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 1.w,
                                            vertical: 0.5.h,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.primaryColor,
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: TextButton(
                                              onPressed: () async {
                                                await prov.follow(index);
                                              },
                                              child: FittedBox(
                                                child: Text(
                                                  'follow',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge,
                                                ),
                                              )),
                                        ),
                                      )
                              ],
                            ),
                          );
                        },
                      ),
                    )
            ],
          )),
      bottomSheet: BottomSheetButton(
        onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => const FillProfile()));
      /*    print('sssssss ${topicsProv.selectedTopics}');
          print('ggggg ${topicsProv.topics.length}');
          print('id is ${countryProv.selectedCountryId}');*/
        },
      ),
    );
  }
}
