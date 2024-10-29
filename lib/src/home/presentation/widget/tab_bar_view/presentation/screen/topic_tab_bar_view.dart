import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder.dart';
import 'package:news_app/src/home/presentation/widget/tab_bar_view/presentation/provider/news_by_topic_id_provider.dart';
import 'package:news_app/src/post_screen/presentation/provider/get_post_info_notifier.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../../shared/core/utils/app_assets.dart';

class TopicsTabBarView extends ConsumerWidget {
  const TopicsTabBarView({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //post screen info
    GetPostInfoNotifier getPostInfoNotifier = ref.watch(getPostInfoNotifierProvider);


    // post by id topic
    NewsByTopicIdChangeNotifier newsByTopicIdChangeNotifier =
        ref.watch(newsByTopicIdProvider);
    var item = newsByTopicIdChangeNotifier.newsByTopicId;
    return item.isEmpty
        ? const Center(child: Text('No news found'))
        : newsByTopicIdChangeNotifier.isLoading
            ? const Center(
                child: SpinKitFadingCircle(color: AppColors.primaryColor))
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: item.length,
                padding: EdgeInsets.only(
                  left: 3.w,
                  right: 3.w,
                ),
                itemBuilder: (BuildContext context, int index) {
                  //  var item = allNewsNotifier.allNews;
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
                      postTime: item[index].createdAt,
                      postId: item[index].postId,
                    ),
                  );
                },
              );
  }
}
