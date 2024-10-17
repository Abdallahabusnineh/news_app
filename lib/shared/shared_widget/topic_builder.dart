import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/src/topics/presentation/providers/topics_notifer_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopicBuilder extends ConsumerWidget {
  const TopicBuilder(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.index,
      required this.isSaved});

  final String image, title, subtitle;
  final bool isSaved;
  final int index;

  @override
  Widget build(BuildContext context, ref) {
    TopicsNotifier notifier = ref.watch(topicsNotifierProvider);
    return Row(
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 1.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                maxLines: 2,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 1.w,
        ),
        isSaved
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.primaryColor),
                child: TextButton(
                  onPressed: () {
                    notifier.toggleTopic(index);
                  },
                  child: Text('Saved',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: AppColors.whiteColor
                      )),
                ))
            : Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.primaryColor, width: 1),
                ),
                child: TextButton(
                  onPressed: () {
                    notifier.toggleTopic(index);
                  },
                  child: Text('Save',
                      style: Theme.of(context).textTheme.displayLarge),
                )),
      ],
    );
  }
}
