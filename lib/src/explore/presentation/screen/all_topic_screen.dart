import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/shared_widget/topic_builder.dart';
import 'package:news_app/src/topics/presentation/providers/topics_notifer_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllTopicScreen extends ConsumerWidget {
  const AllTopicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TopicsNotifier notifier = ref.watch(topicsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Topics',
        ),
      ),
      body: notifier.isLoading
          ? const Center(
              child: SpinKitFadingCircle(
                color: AppColors.primaryColor,
              ),
            )
          : SafeArea(
            child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, i) => TopicBuilder(
                      image: AppAssets.topicImg,
                      title: notifier.topics[i].topic,
                      subtitle: notifier.topics[i].description,
                      isSaved: notifier.topics[i].isSaved,
                      index: i,
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 1.h,
                    ),
                itemCount: notifier.topics.length,),
          ),
    );
  }
}
