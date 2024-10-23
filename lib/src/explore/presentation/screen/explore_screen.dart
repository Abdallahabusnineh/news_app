import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder.dart';
import 'package:news_app/shared/shared_widget/topic_builder.dart';
import 'package:news_app/src/explore/presentation/screen/all_topic_screen.dart';
import 'package:news_app/src/home/presentation/providers/all_news_notifier.dart';
import 'package:news_app/src/topics/presentation/providers/topics_notifer_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TopicsNotifier topicsNotifier = ref.watch(topicsNotifierProvider);
    AllNewsNotifier allNewsNotifier = ref.watch(allNewsChangeNotifierProvider);
    return Scaffold(
        body: topicsNotifier.isLoading
            ? const Center(
                child: SpinKitCircle(
                  color: AppColors.primaryColor,
                ),
              )
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.only(
                  left: 5.w,
                  right: 5.w,
                ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explore',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontSize: 32),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Topic',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontSize: 16)),
                          TextButton(
                              onPressed: () {
                                topicsNotifier.getTopics();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AllTopicScreen(),
                                    ));
                              },
                              child: Text(
                                'See all',
                                style: Theme.of(context).textTheme.labelMedium,
                              ))
                        ],
                      ),
                      ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, i) => TopicBuilder(
                                image: AppAssets.topicImg,
                                title: topicsNotifier.topics[i].topic,
                                subtitle: topicsNotifier.topics[i].description,
                                isSaved: topicsNotifier.topics[i].isSaved,
                                index: i,
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 1.h,
                              ),
                          itemCount: 3),
                      SizedBox(
                        height: 2.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Popular Topic',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, i) => PostBuilder(
                                postImage: AppAssets.trendingImg,
                                postAuthorName:
                                    allNewsNotifier.allNews[i].userName,
                                postContent: allNewsNotifier.allNews[i].content,
                                postTime: allNewsNotifier.allNews[i].createdAt,
                                postAuthorImg: AppAssets.trendingCircleAvatar,
                                postTitle: allNewsNotifier.allNews[i].title,
                                isTrendingPost: true,
                                postId: allNewsNotifier.allNews[i].postId,
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 1.h,
                              ),
                          itemCount: allNewsNotifier.allNews.length),
                    ],
                  ),
                ),
              ));
  }
}
