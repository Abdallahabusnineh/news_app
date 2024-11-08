import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/src/auth/presentation/screen/login/login_screen.dart';
import 'package:news_app/src/auth/presentation/screen/register/register_screen.dart';
import 'package:news_app/src/bookmark/presentation/screen/bookmark_screen.dart';
import 'package:news_app/src/comment_screen/presentation/screen/comment_screen.dart';
import 'package:news_app/src/create_news/presentation/screen/create_news_screen.dart';
import 'package:news_app/src/edit_profile/presentation/screen/edit_profile.dart';
import 'package:news_app/src/explore/presentation/screen/all_topic_screen.dart';
import 'package:news_app/src/explore/presentation/screen/explore_screen.dart';
import 'package:news_app/src/fill_profile/presentation/screen/fill_profile.dart';
import 'package:news_app/src/home/presentation/screen/home_screen.dart';
import 'package:news_app/src/home_search/presentation/screen/home_search_screen.dart';
import 'package:news_app/src/main_screen/presentaion/screen/main_screen.dart';
import 'package:news_app/src/new_sources/presentation/screen/new_sources.dart';
import 'package:news_app/src/notification/presentation/screen/notification_screen.dart';
import 'package:news_app/src/onboarding_screen/initial_screen.dart';
import 'package:news_app/src/onboarding_screen/on_boarding_screen.dart';
import 'package:news_app/src/post_screen/presentation/screen/post_screen.dart';
import 'package:news_app/src/profile/presentation/screen/profile_screen.dart';
import 'package:news_app/src/select_country/presentation/screen/select_country_screen.dart';
import 'package:news_app/src/setting/presentation/screen/setting_screen.dart';
import 'package:news_app/src/topics/presentation/screen/topics.dart';
import 'package:news_app/src/trending/presentation/screen/trending_screen.dart';
import 'package:news_app/src/visit_profile_author/presentation/screen/visit_profile_author_screen.dart';

part 'app_router.gr.dart';
 final appRouter = AppRouter();
@AutoRouterConfig()
class AppRouter extends RootStackRouter  {
/*final appRouter = AppRouter();*/

  @override
  List<AutoRoute> get routes => [
    /// routes go here
    AutoRoute(page: InitialRoute.page,initial: true),
    AutoRoute(page: OnBoardingRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: MainRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: HomeSearchRoute.page),
    AutoRoute(page: ExploreRoute.page),
    AutoRoute(page: AllTopicRoute.page),
    AutoRoute(page: TrendingRoute.page),
    AutoRoute(page: ChooseYourTopicsRoute.page),
    AutoRoute(page: NewSourcesRoute.page),
    AutoRoute(page: CreateNewsPostRoute.page),
    AutoRoute(page: FillProfileRoute.page),
    AutoRoute(page: PostRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: EditProfileRoute.page),
    AutoRoute(page: NotificationRoute.page),
    AutoRoute(page: SettingRoute.page),
    AutoRoute(page: BookmarkRoute.page),
    AutoRoute(page: VisitProfileAuthorRoute.page),
    AutoRoute(page: CommentRoute.page),
    AutoRoute(page: SelectCountryRoute.page,),
  ];

}
