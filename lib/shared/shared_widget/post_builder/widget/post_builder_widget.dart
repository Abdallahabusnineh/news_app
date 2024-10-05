import 'package:flutter/material.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/font_style.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/theme/app_colors.dart';
PostBuilderModel postBuilderModel = PostBuilderModel(
    postId: 1,
    postImage: AppAssets.trendingImg,
    title: "Europe",
    subtitle: "Russian warship: Moskva sinks in Black Sea",
    postTime: "4h ago",
    authorImg: AppAssets.trendingCircleAvatar,
    authorName: "BBC News");



Widget isTrendingPostBuilder() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(
        postBuilderModel.postImage,
        fit: BoxFit.cover,
      ),
      SizedBox(
        height: 1.h,
      ),
      Text(postBuilderModel.title,
          style: AppFontStyle.fontSize13W400ColorExtraLightPurple()),
      Text(
        postBuilderModel.subtitle,
        style: AppFontStyle.fontSize16W400ColorBlack(),
        maxLines: 1,
      ),
      Row(
        children: [
          Image.asset(
            postBuilderModel.authorImg,
          ),
          SizedBox(
            width: 1.w,
          ),
          Text(
            postBuilderModel.authorName,
            style: AppFontStyle.fontSize13W600ColorLightPurple(),
          ),
          SizedBox(
            width: 3.w,
          ),
          Image.asset(
            AppAssets.iconClock,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 1.w,
          ),
          Text(
            postBuilderModel.postTime,
            style: AppFontStyle.fontSize13W400ColorExtraLightPurple(),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                color: AppColors.lightPurpleColor,
              ))
        ],
      ),
    ],
  );
}
Widget latestPostBuilder() {
  return  Row(
    children: [
      Expanded(
        flex: 1,
        child: Image.asset(
          AppAssets.postImage,

        ),
      ),
      SizedBox(
        height: 1.w,
      ),
      Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(postBuilderModel.title,
                style: AppFontStyle.fontSize13W400ColorExtraLightPurple()),
            Text(
              postBuilderModel.subtitle,
              style: AppFontStyle.fontSize16W400ColorBlack(),
              maxLines: 2,
            ),
            Row(
              children: [
                Image.asset(
                  postBuilderModel.authorImg,
                ),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  postBuilderModel.authorName,
                  style: AppFontStyle.fontSize13W600ColorLightPurple(),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Image.asset(
                  AppAssets.iconClock,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  postBuilderModel.postTime,
                  style: AppFontStyle.fontSize13W400ColorExtraLightPurple(),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      color: AppColors.lightPurpleColor,
                    ))
              ],
            ),
          ],
        ),
      ),
    ],
  );
}