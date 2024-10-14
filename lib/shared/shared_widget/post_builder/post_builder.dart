import 'package:flutter/material.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder_model.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class PostBuilder extends StatelessWidget {
  PostBuilder({
    super.key, required this.isTrendingPost,
  });
final bool isTrendingPost ;

  PostBuilderModel postBuilderModel = PostBuilderModel(
      postId: 1,
      postImage: AppAssets.trendingImg,
      title: "Europe",
      subtitle: "Russian warship: Moskva sinks in Black Sea",
      postTime: "4h ago",
      authorImg: AppAssets.trendingCircleAvatar,
      authorName: "BBC News");


  @override
  Widget build(BuildContext context) {
    return isTrendingPost ?Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Column(
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
              style: Theme.of(context).textTheme.labelSmall),
          Text(
            postBuilderModel.subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
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
                style: Theme.of(context).textTheme.displaySmall,

              ),
              SizedBox(
                width: 3.w,
              ),
              Image.asset(
                AppAssets.iconClock,
                fit: BoxFit.cover,
                color: Theme.of(context).brightness == Brightness.light?AppColors.lightPurpleColor:AppColors.lightGreyColor,

              ),
              SizedBox(
                width: 1.w,
              ),
              Text(
                postBuilderModel.postTime,
                style: Theme.of(context).textTheme.labelSmall,
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
    ):
    Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Row(
        children: [
          Expanded(
            child: Image.asset(
              AppAssets.postImage,
              fit: BoxFit.cover,

            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(postBuilderModel.title,
                    style: Theme.of(context).textTheme.labelSmall),
               
                Text(
                  postBuilderModel.subtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
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
                      style: Theme.of(context).textTheme.displaySmall,
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
                      style: Theme.of(context).textTheme.labelSmall,
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
      ),
    );
  }

}
