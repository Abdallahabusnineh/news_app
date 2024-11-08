import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/shared_widget/topic_builder.dart';
import 'package:news_app/src/topics/presentation/providers/topics_notifer_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopicsTabBarView extends ConsumerWidget {
  const TopicsTabBarView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    TopicsNotifier notifier = ref.watch(topicsNotifierProvider);
    return notifier.isLoading
        ? const Center(
            child: SpinKitSquareCircle(
              color: AppColors.primaryColor,
            ),
          )
        : ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, i) => TopicBuilder(
              topic: notifier.topics[i],
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: 2.h,
            ),
            itemCount: notifier.topics.length,
          );
  }
}
