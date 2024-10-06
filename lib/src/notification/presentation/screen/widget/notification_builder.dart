import 'package:flutter/material.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/font_style.dart';
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
        color: Color(0xFFEEF1F4),
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
                        style: AppFontStyle.fontSize16W600ColorBlack(),
                      ),
                      TextSpan(
                        text:
                        allNotification[index].body,
                        style: AppFontStyle.fontSize16W400ColorBlack(),
                      ),
                    ],
                  ),
                ),
                Text(
                  allNotification[index].dateTime,
                  style: AppFontStyle.fontSize13W400ColorExtraLightPurple(),
                )
              ],
            ),
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
                Icon(Icons.add, color: AppColors.primaryColor),
                Text(
                  'Follow',
                  style: AppFontStyle.fontSize16W600ColorBlue(),
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
