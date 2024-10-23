import 'package:flutter/material.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/src/home_search/presentation/widget/author_tab_bar_view.dart';
import 'package:news_app/src/home_search/presentation/widget/news_tab_bar_view.dart';
import 'package:news_app/src/home_search/presentation/widget/topics_tab_bar_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class HomeSearchScreen extends StatelessWidget {
  const HomeSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 5.w,
              right: 5.w,
              top: 3.h,
            ),
            child: Column(
              children: [
                SearchBar(
                  onTap: () {
                    // here we will go to search screen by tabBar view
                  },
                  hintText: 'Search ',
                  leading: Image.asset(
                    AppAssets.iconSearch,
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.lightPurpleColor
                        : AppColors.lightGreyColor,
                  ),
                  trailing: List.filled(
                      1,
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColors.lightPurpleColor
                                  : AppColors.lightGreyColor,
                        ),
                        onPressed: () {},
                      ),
                      growable: true),
                ),
                TabBar(

                  dividerColor: Colors.transparent,
                  indicatorColor: AppColors.primaryColor,
                  indicatorWeight: 1,
                  unselectedLabelColor:
                      Theme.of(context).brightness == Brightness.light
                          ? AppColors.lightPurpleColor
                          : AppColors.lightGreyColor,
                  unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  labelColor: Theme.of(context).brightness == Brightness.light
                      ? AppColors.lightPurpleColor
                      : AppColors.lightGreyColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  onTap: (value) {},
                  tabs: const [
                    Tab(text: 'News',),
                    Tab(text: 'Topics'),
                    Tab(text: 'Author'),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                const Expanded(
                  child: TabBarView(children: [
                    NewsTabBarView(),
                    TopicsTabBarView(),
                    AuthorTabBarView()
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
