import 'package:flutter/material.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/src/notification/presentation/screen/widget/notification_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationBuilder extends StatelessWidget {
   NotificationBuilder({super.key, required this.index});
   final int index;
  NotificationModel ?notificationModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light?const Color(0xFFEEF1F4):const Color(0xFF3A3B3C),

        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              allNotification[index].image,
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
                        text: allNotification[index].title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextSpan(
                        text:
                        allNotification[index].body,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Text(
                  allNotification[index].dateTime,
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),

          SizedBox(
            width: 2.w,
          ),
          allNotification[index].type == NotificationType.follow
              ?Container(
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
