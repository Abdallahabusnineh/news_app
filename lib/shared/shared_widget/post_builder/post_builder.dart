import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/src/bookmark/presentation/provider/bookmark_notifier.dart';
import 'package:news_app/src/home/presentation/providers/all_news_notifier.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
class PostBuilder extends ConsumerWidget {
  final bool isTrendingPost;
  final String postImage;
  final String postTitle;
  final String postContent;
  final String postAuthorName;
  final String postAuthorImg;
  final String postTime;
  int postId;

  PostBuilder(
      {super.key,
      required this.isTrendingPost,
      required this.postImage,
      required this.postTitle,
      required this.postContent,
      required this.postAuthorName,
      required this.postAuthorImg,
      required this.postTime,
      required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BookmarkNotifier bookmarkNotifier = ref.watch(bookmarkNotifierProvider);
    return isTrendingPost
        ? Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  postImage,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(postTitle, style: Theme.of(context).textTheme.labelSmall),
                Text(
                  postContent,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    Image.asset(
                      postAuthorImg,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      postAuthorName,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Image.asset(
                      AppAssets.iconClock,
                      fit: BoxFit.cover,
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColors.lightPurpleColor
                          : AppColors.lightGreyColor,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Flexible(
                      child: Text(
                        postTime,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          bookmarkNotifier.toggleBookmark(postId);

                        },
                        icon: Icon(
                          bookmarkNotifier.allBookmark
                              .where((element) =>
                          element.postId == postId)
                              .isNotEmpty
                              ? Icons.bookmark
                              : Icons.bookmark_outline,
                          color: AppColors.primaryColor,
                        ))
                  ],
                ),
              ],
            ),
          )
        : Padding(
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
                      Text(postTitle,
                          style: Theme.of(context).textTheme.labelSmall),
                      Text(
                        postContent,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 2,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            postAuthorImg,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            postAuthorName,
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
                          Flexible(
                            child: Text(
                              postTime,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                bookmarkNotifier.toggleBookmark(postId);
                              },
                              icon: Icon(
                                bookmarkNotifier.allBookmark
                                        .where((element) =>
                                            element.postId == postId)
                                        .isNotEmpty
                                    ? Icons.bookmark
                                    : Icons.bookmark_outline,
                                color: AppColors.primaryColor,
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
