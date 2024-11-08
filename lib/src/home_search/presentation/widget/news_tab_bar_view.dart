import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder.dart';
import 'package:news_app/src/home/presentation/providers/all_news_notifier.dart';
import 'package:news_app/src/post_screen/presentation/provider/get_post_info_notifier.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewsTabBarView extends ConsumerWidget {
  const NewsTabBarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GetPostInfoNotifier getPostInfoNotifier = ref.watch(getPostInfoNotifierProvider);

    AllNewsNotifier allNewsNotifier = ref.watch(allNewsChangeNotifierProvider);

    return  allNewsNotifier.isLoading ? Center(
      child:  SpinKitSquareCircle(
        color: AppColors.primaryColor,
        size: 20.sp,
      ),
    ):    ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: allNewsNotifier.allNews.length,
      itemBuilder: (BuildContext context, int index) {
        var item = allNewsNotifier.allNews;
        return InkWell(
          onTap: () {
            getPostInfoNotifier.getPostInfo(item[index].postId);
           appRouter.push(const PostRoute());
          },
          child: PostBuilder(
          isTrendingPost: false,
          postImage: AppAssets.trendingImg,
          postTitle: item[index].title,
          postContent: item[index].content,
          postAuthorName: item[index].userName,
          postAuthorImg: AppAssets.trendingCircleAvatar,
          postTime: item[index].createdAt, postId: item[index].postId, ),
        );
      },
    );
  }
}
