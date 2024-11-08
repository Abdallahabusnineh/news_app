import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/shared_widget/image_loader.dart';
import 'package:news_app/src/topics/data/model/topics_model.dart';
import 'package:news_app/src/topics/presentation/providers/topics_notifer_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopicBuilder extends ConsumerWidget {
  const TopicBuilder(
      {super.key, required this.topic,
    });

final  TopicsModel topic;



  @override
  Widget build(BuildContext context, ref) {
    TopicsNotifier notifier = ref.watch(topicsNotifierProvider);
    return Row(
      children: [

        FancyImageLoader(
         path: topic.imageUri,
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
                topic.topic,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                topic.description,
                style: Theme.of(context).textTheme.labelMedium,
                maxLines: 2,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 1.w,
        ),
        topic.isSaved
            ? Container(
            height: 40,
            width: 78,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.primaryColor),
                child: TextButton(
                  onPressed: () {

                    notifier.toggleTopics(topic.id);
                  },
                  child: Text('Saved',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(color: AppColors.whiteColor)),
                ))
            : Container(
                height: 40,
                width: 78,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.primaryColor, width: 1),
                ),
                child: TextButton(
                  onPressed: () {

                    notifier.toggleTopics(topic.id);
                  },
                  child: Text('Save',
                      style: Theme.of(context).textTheme.displayLarge),
                )),
      ],
    );
  }
}
