import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:news_app/src/new_sources/presentation/providers/newsource_notifier.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../shared/core/theme/app_colors.dart';
import '../../../../shared/shared_widget/bottom_sheet_button.dart';

import 'package:auto_route/auto_route.dart';
@RoutePage()
class NewSources extends ConsumerWidget {
  const NewSources({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NewsourceNotifier notifier =
    ref.watch(newSourceChangeNotifierProviderTest);
    bool isSuccess=notifier.isSuccess;
    var sources = notifier.sources;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
appRouter.popForced();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Choose Your New Sources',
        ),
      ),
      body: Padding(
        padding:
        EdgeInsets.only(left: 3.w, right: 3.w, top: 1.h, bottom: 15.h),
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
                notifier.getSources(value);
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            !isSuccess?
            const SpinKitSquareCircle(
              color: AppColors.primaryColor,
            ): Expanded(
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
                        bool isFollowed = item.isFollowed;
                        return Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            right: 8,
                            left: 8,
                            top: 5,
                            bottom: 5,
                              ),
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

                                  padding: const EdgeInsets.only(
                                    right: 13,
                                    left: 13,
                                    top: 7,
                                    bottom: 7,
                                  ),
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
                              SizedBox(
                                height: 1.h,
                              ),
                              notifier.selectedId==notifier.sources[index].id?const SpinKitFadingCircle(
                                color: AppColors.primaryColor,
                              ):
                              isFollowed
                                  ? Expanded(
                                      child: Container(
                                        width: double.infinity,

                                        decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: TextButton(
                                            onPressed: ()  {
                                               notifier.follow(notifier.sources[index].id);
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
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.primaryColor,
                                              width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: TextButton(
                                            onPressed: ()  {
                                               notifier.follow(notifier.sources[index].id);
                                            },
                                            child: FittedBox(
                                              child: Text(
                                                    'Follow',
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
        ),
      ),
      bottomSheet: BottomSheetButton(
        onPressed: () {
          appRouter.push(const FillProfileRoute());
      /*    print('sssssss ${topicsProv.selectedTopics}');
          print('ggggg ${topicsProv.topics.length}');
          print('id is ${countryProv.selectedCountryId}');*/
        },
      ),
    );
  }
}
