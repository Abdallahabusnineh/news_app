import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/src/new_sources/presentation/providers/newsource_notifier.dart';
import 'package:news_app/src/visit_profile_author/presentation/provider/profile_author_notifier.dart';
import 'package:news_app/src/visit_profile_author/presentation/widget/news_by_user_id_tabbar.dart';
import 'package:news_app/src/visit_profile_author/presentation/widget/recent_news_by_user_id_tabbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VisitProfileAuthorScreen extends ConsumerWidget {
  const VisitProfileAuthorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NewsourceNotifier newsourceNotifier =
        ref.watch(newSourceChangeNotifierProviderTest);
    ProfileAuthorNotifier profileAuthorNotifier =
        ref.watch(profileAuthorProvider);
    var items = profileAuthorNotifier.profileAuthorModels;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
          ],
        ),
        body: profileAuthorNotifier.isLoading
            ? const Center(
                child: SpinKitDoubleBounce(color: AppColors.primaryColor),
              )
            : Padding(
                padding: EdgeInsets.only(
                  left: 5.w,
                  right: 5.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CircleAvatar(
                            radius: 30.sp,
                            backgroundImage: const AssetImage(
                              AppAssets.trendingCircleAvatar,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Column(
                          children: [
                            Text(
                              '${items!.followersCount}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'Followers',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Column(
                          children: [
                            Text(
                              '${items.followingCount}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'Following',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Column(
                          children: [
                            Text(
                              '${items.newsCount}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'News',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      items.userName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      items.bio,
                      style: Theme.of(context).textTheme.labelLarge,
                      maxLines: 3,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: <Widget>[
                        newsourceNotifier.toggleFollowUpdate
                            ? const Expanded(
                                child: SpinKitFadingCircle(
                                color: AppColors.primaryColor,
                              ))
                            : newsourceNotifier
                                    .sources[profileAuthorNotifier
                                        .profileAuthorModels!.id]
                                    .isFollowed
                                ? Expanded(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          newsourceNotifier.follow(
                                              profileAuthorNotifier
                                                  .profileAuthorModels!.id);
                                          print(
                                              'followed ${profileAuthorNotifier.profileAuthorModels!.id}');
                                        },
                                        child: const Text('Following')))
                                : Expanded(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          newsourceNotifier.follow(
                                              profileAuthorNotifier
                                                  .profileAuthorModels!.id);
                                          print(
                                              'followed ${profileAuthorNotifier.profileAuthorModels!.id}');
                                        },
                                        child: const Text('Follow'))),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('WebSite'))),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TabBar(
                      dividerColor: Colors.transparent,
                      indicatorColor: AppColors.primaryColor,
                      indicatorWeight: 1,
                      unselectedLabelColor:
                          Theme.of(context).brightness == Brightness.light
                              ? AppColors.lightPurpleColor
                              : AppColors.lightGreyColor,
                      unselectedLabelStyle:
                          Theme.of(context).textTheme.labelLarge,
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      labelColor:
                          Theme.of(context).brightness == Brightness.light
                              ? AppColors.blackColor
                              : AppColors.lightGreyColor,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      indicatorSize: TabBarIndicatorSize.label,
                      onTap: (value) {},
                      tabs: const [
                        Tab(
                          text: 'News',
                        ),
                        Tab(text: 'Recent'),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Expanded(
                      child: TabBarView(children: [
                        NewsByUserIdTabBar(),
                        RecentNewsByUserIdTabBar()
                      ]),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
