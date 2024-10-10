import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/src/new_sources/presentation/screen/new_sources.dart';
import 'package:news_app/src/topics/presentation/providers/topics_notifer.dart';
import 'package:news_app/src/topics/presentation/providers/topics_state.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../shared/core/theme/app_colors.dart';
import '../../../../shared/core/utils/font_style.dart';
import '../../../../shared/shared_widget/bottom_sheet_button.dart';

class ChooseYourTopics extends ConsumerWidget {
  const ChooseYourTopics({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TopicsState state = ref.watch(topicsNotifierProvider);
    TopicsNotifier notifier = ref.read(topicsNotifierProvider.notifier);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text(
            'Choose your topics',
          ),
        ),
        body:
            //notifier.topics.isEmpty ? const Center(child: CircularProgressIndicator()) :
            Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                child: Column(
                  children: [
                    SearchBar(
                      hintText: 'Search ',
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
                      onChanged: (value) {
                        notifier.getTopics(value);
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Skeletonizer(
                        enabled: notifier.topics.isEmpty ? true : false,
                        containersColor: Colors.grey.shade300,
                        child: Wrap(
                          spacing: 2.w,
                          runSpacing: 1.h,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            for (int index = 0;
                                index < notifier.topics.length;
                                index++)
                              notifier.isTopicSelected ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: AppColors.primaryColor,
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          notifier.isTopicSelected =
                                              !notifier.isTopicSelected;
                                        },
                                        child: Text(
                                            notifier.topics[index].topic,
                                            style: AppFontStyle.w600ColorBlue(
                                                fontSize: 14)),
                                      ))
                                  : Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            color: AppColors.primaryColor,
                                            width: 1),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          notifier.isTopicSelected =
                                              !notifier.isTopicSelected;
                                        },
                                        child: Text(
                                            notifier.topics[index].topic,
                                            style: AppFontStyle.w600ColorBlue(
                                                fontSize: 14)),
                                      )),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
        bottomSheet: BottomSheetButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const NewSources()));
          },
        ));
  }
}
