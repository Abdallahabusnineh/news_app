import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:news_app/src/profile/presentation/provider/my_profile_notifier.dart';
import 'package:news_app/src/profile/presentation/widget/my_news_tab_bar.dart';
import 'package:news_app/src/profile/presentation/widget/recent_my_news_tab_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:auto_route/auto_route.dart';
@RoutePage()
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyProfileNotifier myProfileNotifier = ref.watch(myProfileNotifierProvider);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            appRouter.push( CreateNewsPostRoute());

          },
          backgroundColor: AppColors.primaryColor,
          child: const Icon(
            Icons.add,
            color: AppColors.whiteColor,
          ),
        ),
        appBar: AppBar(
          title: Text(
            'Profile',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            IconButton(
              onPressed: () {
              appRouter.push(const SettingRoute());
              },
              icon: Image.asset(
                AppAssets.iconSettings,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : AppColors.whiteColor,
                height: 5.h,
                width: 5.h,
              ),
            ),
          ],
        ),
        body: myProfileNotifier.isLoading
            ? const Center(
                child: SpinKitFadingCircle(color: AppColors.primaryColor))
            : RefreshIndicator(
              onRefresh: () {
                return myProfileNotifier.getMyProfileInfo();

              },
              child: Padding(
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
                              backgroundImage:
                                  const AssetImage(AppAssets.trendingCircleAvatar),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            children: [
                              Text(
                                "${myProfileNotifier.myProfileModels?.followersCount}",
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
                                '${myProfileNotifier.myProfileModels?.followingCount}',
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
                                '${myProfileNotifier.myProfileModels?.newsCount}',
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
                        '${myProfileNotifier.myProfileModels?.userName}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      myProfileNotifier.myProfileModels?.bio == null
                          ? const SizedBox()
                          : Text(
                              '${myProfileNotifier.myProfileModels?.bio}',
                              style: Theme.of(context).textTheme.labelLarge,
                              maxLines: 3,
                            ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    appRouter.push(const EditProfileRoute());
                                  },
                                  child: const Text('Edit Profile'))),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Website'))),
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
                        child: TabBarView(
                            children: [MyNewsTabBar(), RecentMyNewsTabBar()]),
                      ),
                    ],
                  ),
                ),
            ),
      ),
    );
  }
}
