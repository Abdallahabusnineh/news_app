import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder.dart';
import 'package:news_app/src/bookmark/presentation/provider/bookmark_notifier.dart';
import 'package:news_app/src/post_screen/presentation/provider/get_post_info_notifier.dart';
import 'package:news_app/src/post_screen/presentation/screen/post_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BookmarkScreen extends ConsumerWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
GetPostInfoNotifier getPostInfoNotifier = ref.watch(getPostInfoNotifierProvider);
    BookmarkNotifier bookmarkNotifier = ref.watch(bookmarkNotifierProvider);
    return Scaffold(
      body: bookmarkNotifier.isLoading
          ? const Center(
              child: SpinKitFadingCircle(color: AppColors.primaryColor))
          : SafeArea(
              child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bookmark',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontSize: 32),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SearchBar(
                        hintText: 'Search ',
                        leading: Image.asset(
                          AppAssets.iconSearch,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColors.lightPurpleColor
                                  : AppColors.lightGreyColor,
                        ),
                        trailing: List.filled(
                            1,
                            Image.asset(AppAssets.iconFilters,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? AppColors.lightPurpleColor
                                    : AppColors.lightGreyColor),
                            growable: true),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: bookmarkNotifier.allBookmark.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = bookmarkNotifier.allBookmark[index];
                          return InkWell(
                            onTap: () {
                              getPostInfoNotifier.getPostInfo(item.postId);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PostScreen(),
                                ),
                              );
                            },
                            child: PostBuilder(
                              isTrendingPost: false,
                              postImage: AppAssets.trendingImg,
                              postTitle: item.postTitle,
                              postContent: item.postContent,
                              postAuthorName: item.userName,
                              postAuthorImg: AppAssets.trendingCircleAvatar,
                              postTime: item.postCreatedAt,
                              postId: item.postId,
                            ),
                          );
                        },
                      ),
                    ],
                  )),
            ),
    );

  }
}
