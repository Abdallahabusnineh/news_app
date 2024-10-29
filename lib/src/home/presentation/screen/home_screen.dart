import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder.dart';
import 'package:news_app/src/home/presentation/providers/all_news_notifier.dart';
import 'package:news_app/src/home/presentation/widget/constant.dart';
import 'package:news_app/src/home/presentation/widget/tab_bar_view/presentation/provider/news_by_topic_id_provider.dart';
import 'package:news_app/src/notification/presentation/providers/notification_notifier.dart';
import 'package:news_app/src/trending/presentation/providers/trending_news_notifier.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../shared/core/theme/app_colors.dart';
import '../widget/tab_bar_view/presentation/screen/topic_tab_bar_view.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NewsByTopicIdChangeNotifier newsByTopicIdChangeNotifier =
        ref.watch(newsByTopicIdProvider);
    NotificationNotifier notificationNotifier =
        ref.watch(notificationChangeNotifierProvider);
    AllNewsNotifier allNewsNotifier = ref.watch(allNewsChangeNotifierProvider);
    TrendingNewsNotifier trendingNewsNotifier =
        ref.watch(trendingNewsChangeNotifierProvider);
    return DefaultTabController(
        length: categories.length,
        child: Scaffold(
            appBar: AppBar(
                title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppAssets.logoAppBar,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColors.whiteColor
                          : const Color(0xFF3A3B3C),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withOpacity(0.1),
                          offset: const Offset(0, 0),
                          blurRadius: 10,
                        )
                      ]),
                  child: IconButton(
                      onPressed: () {
                        notificationNotifier.getNotifications();
                        appRouter.push(const NotificationRoute());
                      },
                      icon: Image.asset(
                        AppAssets.iconNotifications,
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.blackColor
                            : AppColors.whiteColor,
                      )),
                ),
              ],
            )),
            body: allNewsNotifier.isLoading
                ? Center(
                    child: SpinKitSquareCircle(
                      color: AppColors.primaryColor,
                      size: 20.sp,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 3.h),
                    child: CustomScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        slivers: [
                          SliverToBoxAdapter(
                            child: SearchBar(
                              onTap: () {
                                appRouter.push(const HomeSearchRoute());
                              },
                              hintText: 'Search ',
                              leading: Image.asset(
                                AppAssets.iconSearch,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
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
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: 1.h,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Trending',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                TextButton(
                                  onPressed: () {
                                    trendingNewsNotifier.getTrendingNews();

                                    appRouter.push(const TrendingRoute());
                                  },
                                  child: Text(
                                    'see all',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: 2.h,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: PostBuilder(
                              isTrendingPost: true,
                              postImage: AppAssets.trendingImg,
                              postTitle: allNewsNotifier.allNews[0].title,
                              postContent: allNewsNotifier.allNews[0].content,
                              postAuthorName:
                                  allNewsNotifier.allNews[0].userName,
                              postAuthorImg: AppAssets.trendingCircleAvatar,
                              postTime: allNewsNotifier.allNews[0].createdAt,
                              postId: allNewsNotifier.allNews[0].postId,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Latest',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'see all',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: TabBar(
                              labelPadding:
                                  EdgeInsets.only(left: 0.5.w, right: 1.w),
                              dividerColor: Colors.transparent,
                              indicatorColor: AppColors.primaryColor,
                              tabAlignment: TabAlignment.start,
                              unselectedLabelColor:
                                  Theme.of(context).brightness ==
                                          Brightness.light
                                      ? AppColors.lightPurpleColor
                                      : AppColors.lightGreyColor,
                              unselectedLabelStyle:
                                  Theme.of(context).textTheme.labelLarge,
                              labelStyle:
                                  Theme.of(context).textTheme.titleMedium,
                              labelColor: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? AppColors.blackColor
                                  : AppColors.lightGreyColor,
                              indicatorSize: TabBarIndicatorSize.label,
                              onTap: (value) {
                                newsByTopicIdChangeNotifier.getNewsByTopicId(
                                    categories.values.toList()[value]);
                              },
                              isScrollable: true,
                              tabs: [
                                for (int i = 0; i < categories.length; i++)
                                  Tab(
                                    child: Text(
                                      categories.keys.toList()[i],
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: 2.h,
                            ),
                          ),
                          const SliverToBoxAdapter(
                            child: TopicsTabBarView(),
                          ),
                        ]),
                  )));
  }
}
