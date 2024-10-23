/*
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/src/new_sources/presentation/providers/newsource_notifier.dart';
import 'package:news_app/src/new_sources/presentation/screen/new_sources.dart';
import 'package:news_app/src/notification/presentation/providers/notification_notifier.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationBuilder extends ConsumerWidget {
   NotificationBuilder({super.key, required this.index});
   final int index;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    NotificationNotifier notificationNotifier =ref.watch(notificationChangeNotifierProvider);
    var notification = notificationNotifier.notification;
    NewsourceNotifier newSourceNotifier =ref.watch(newSourceChangeNotifierProviderTest);
    bool isFollowing = newSourceNotifier.userFollowing(notification[index].notifierId);

    print('notification[index].notifierId ${notification[index].notifierId}');

    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light?const Color(0xFFEEF1F4):const Color(0xFF3A3B3C),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: const AssetImage(
              AppAssets.notificationImg,
            ),
            radius: 25.sp,
          ),
          SizedBox(
            width: 3.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: notification[index].notifierUserName,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
                      ),
                       WidgetSpan(
                        child: SizedBox(
                          width: 1.w,
                        ),
                      ),
                      TextSpan(
                        text:
                        'is now following you',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Text(
                  '${notification[index].createdAt}',
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),

          SizedBox(
            width: 2.w,
          ),
          notification[index].type == 'follow_request'
              ?isFollowing?Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
            decoration: BoxDecoration(
              color:  AppColors.primaryColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'Following',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.whiteColor),
            ),
          ):Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryColor
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.add, color: AppColors.primaryColor),
                Text(
                  'Follow',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
          )
              :const SizedBox()

        ],
      ),
    );
  }
}
*/
