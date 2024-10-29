import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/shared_widget/topic_builder.dart';
import 'package:news_app/src/topics/presentation/providers/topics_notifer_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:auto_route/auto_route.dart';
@RoutePage()
class AllTopicScreen extends ConsumerWidget {
  const AllTopicScreen({super.key});

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
                itemBuilder: (context, i) => TopicBuilder(topic: notifier.topics[i],),
                separatorBuilder: (context, index) => SizedBox(
                      height: 1.h,
                    ),
                itemCount: notifier.topics.length,),
          ),
    );
  }
}
