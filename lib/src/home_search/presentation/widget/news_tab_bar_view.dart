import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder.dart';
import 'package:news_app/src/home/presentation/providers/all_news_notifier.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewTabBarView extends ConsumerWidget {
  const NewTabBarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        return PostBuilder(
            isTrendingPost: false,
            postImage: AppAssets.trendingImg,
            postTitle: item[index].title,
            postContent: item[index].content,
            postAuthorName: item[index].userName,
            postAuthorImg: AppAssets.trendingCircleAvatar,
            postTime: item[index].createdAt);
      },
    );
  }
}
