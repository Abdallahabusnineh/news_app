import 'package:flutter/material.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/shared_widget/autho_builder.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder.dart';
import 'package:news_app/shared/shared_widget/topic_builder.dart';
import 'package:news_app/src/visit_profile_author/presentation/screen/visit_profile_author_screen.dart';
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
                    Navigator.pop(context);
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
                  labelColor: Theme.of(context).brightness == Brightness.light
                      ? AppColors.lightPurpleColor
                      : AppColors.lightGreyColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  onTap: (value) {},
                  tabs: const [
                    Tab(text: 'News'),
                    Tab(text: 'Topics'),
                    Tab(text: 'Author'),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: TabBarView(children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int i = 0; i < 10; i++)
                            PostBuilder(
                              isTrendingPost: false,
                            ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Wrap(
                        runSpacing: 1.h,
                        children: [
                          for (int i = 0; i < 10; i++)
                            const TopicBuilder(
                              image: AppAssets.topicImg,
                              title: 'Health',
                              subtitle:
                                  'Get energizing workout moves, healthy recipes',
                            ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Wrap(
                        runSpacing: 2.h,
                        children: [
                          for (int i = 0; i < 10; i++)
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const VisitProfileAuthorScreen(),
                                  ),
                                );
                              },
                              child: const AuthorBuilder(
                                authorName: 'BBC News',
                                authorImg: AppAssets.trendingCircleAvatar,
                                subtitle: '12M Followers',
                              ),
                            )
                        ],
                      ),
                    ),
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
