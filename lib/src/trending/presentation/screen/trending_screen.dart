import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder.dart';
import 'package:news_app/src/trending/presentation/providers/trending_news_notifier.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:auto_route/auto_route.dart';
@RoutePage()
class TrendingScreen extends ConsumerWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TrendingNewsNotifier trendingNewsNotifier =
        ref.watch(trendingNewsChangeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trending',
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: trendingNewsNotifier.isLoading
          ? const SpinKitSquareCircle(
              color: AppColors.primaryColor,
            )
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              itemCount: trendingNewsNotifier.trendingNews.length,
              itemBuilder: (context, index) {
                var item = trendingNewsNotifier.trendingNews;
                return PostBuilder(
                  isTrendingPost: true,
                  postImage: AppAssets.trendingImg,
                  postTitle: item[index].title,
                  postContent: item[index].content,
                  postAuthorName: item[index].userName,
                  postAuthorImg: AppAssets.trendingCircleAvatar,
                  postTime: item[index].createdAt,
                  postId: item[index].postId,
                );
              },
            ),
    );
  }
}
