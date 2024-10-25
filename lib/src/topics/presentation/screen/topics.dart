import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/font_style.dart';
import 'package:news_app/shared/shared_widget/bottom_sheet_button.dart';
import 'package:news_app/src/new_sources/presentation/screen/new_sources.dart';
import 'package:news_app/src/topics/data/model/topics_model.dart';
import 'package:news_app/src/topics/presentation/providers/topics_notifer_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseYourTopics extends ConsumerWidget {
  const ChooseYourTopics({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TopicsNotifier notifier = ref.watch(topicsNotifierProvider);

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
                        /* notifier.getTopicsBySearch(value);*/
                        /*  notifier.searchTopic(value);*/
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child:     Wrap(
                          spacing: 2.w,
                          runSpacing: 1.h,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            for (var topic in notifier.topics)

                            TopicsNotifier.selectedTopics.contains(topic.id)
                                ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColors.primaryColor,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    notifier
                                        .toggleSelectedTopic(topic.id);
                                    print('id ${topic.id}');
                                   // print('index ${index}');
                                  },
                                  child: Text(
                                    topic.topic,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                        color: AppColors.whiteColor),
                                  ),
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
                                    notifier
                                        .toggleSelectedTopic(topic.id);
                                    print('id ${topic.id}');
                                  },
                                  child: Text(topic.topic,
                                      style: AppFontStyle.w600ColorBlue(
                                          fontSize: 14)),
                                )),
                          ],
                        )
                      ),
                    ),
                  ],
                )),
        bottomSheet: BottomSheetButton(
          onPressed: () {
            if (notifier.topics
                .where((element) => element.isSaved == true)
                .isNotEmpty) {
              print('build home screen ${TopicsNotifier.selectedTopics}');

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NewSources()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Please select at least one topic.')));
            }
          },
        ));
  }
}
