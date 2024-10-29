// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AllTopicScreen]
class AllTopicRoute extends PageRouteInfo<void> {
  const AllTopicRoute({List<PageRouteInfo>? children})
      : super(
          AllTopicRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllTopicRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AllTopicScreen();
    },
  );
}

/// generated route for
/// [BookmarkScreen]
class BookmarkRoute extends PageRouteInfo<void> {
  const BookmarkRoute({List<PageRouteInfo>? children})
      : super(
          BookmarkRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookmarkRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BookmarkScreen();
    },
  );
}

/// generated route for
/// [ChooseYourTopics]
class ChooseYourTopicsRoute extends PageRouteInfo<void> {
  const ChooseYourTopicsRoute({List<PageRouteInfo>? children})
      : super(
    ChooseYourTopicsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseYourTopicsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChooseYourTopics();
    },
  );
}

/// generated route for
/// [CommentScreen]
class CommentRoute extends PageRouteInfo<CommentRouteArgs> {
  CommentRoute({
    Key? key,
    required int postId,
    List<PageRouteInfo>? children,
  }) : super(
          CommentRoute.name,
          args: CommentRouteArgs(
            key: key,
            postId: postId,
          ),
          initialChildren: children,
        );

  static const String name = 'CommentRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CommentRouteArgs>();
      return CommentScreen(
        key: args.key,
        postId: args.postId,
      );
    },
  );
}

class CommentRouteArgs {
  const CommentRouteArgs({
    this.key,
    required this.postId,
  });

  final Key? key;

  final int postId;

  @override
  String toString() {
    return 'CommentRouteArgs{key: $key, postId: $postId}';
  }
}

/// generated route for
/// [CreateNewsPost]
class CreateNewsPostRoute extends PageRouteInfo<CreateNewsPostArgs> {
  CreateNewsPostRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
    CreateNewsPostRoute.name,
          args: CreateNewsPostArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreateNewsPostRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateNewsPostArgs>(
          orElse: () => const CreateNewsPostArgs());
      return CreateNewsPost(key: args.key);
    },
  );
}

class CreateNewsPostArgs {
  const CreateNewsPostArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CreateNewsPostArgs{key: $key}';
  }
}

/// generated route for
/// [EditProfileScreen]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EditProfileScreen();
    },
  );
}

/// generated route for
/// [ExploreScreen]
class ExploreRoute extends PageRouteInfo<void> {
  const ExploreRoute({List<PageRouteInfo>? children})
      : super(
          ExploreRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExploreRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ExploreScreen();
    },
  );
}

/// generated route for
/// [FillProfile]
class FillProfileRoute extends PageRouteInfo<void> {
  const FillProfileRoute({List<PageRouteInfo>? children})
      : super(
    FillProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'FillProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FillProfile();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [HomeSearchScreen]
class HomeSearchRoute extends PageRouteInfo<void> {
  const HomeSearchRoute({List<PageRouteInfo>? children})
      : super(
          HomeSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeSearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeSearchScreen();
    },
  );
}

/// generated route for
/// [InitialScreen]
class InitialRoute extends PageRouteInfo<void> {
  const InitialRoute({List<PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InitialScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [NewSources]
class NewSourcesRoute extends PageRouteInfo<void> {
  const NewSourcesRoute({List<PageRouteInfo>? children})
      : super(
    NewSourcesRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewSourcesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NewSources();
    },
  );
}

/// generated route for
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationScreen();
    },
  );
}

/// generated route for
/// [OnBoardingScreen]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute({List<PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnBoardingScreen();
    },
  );
}

/// generated route for
/// [PostScreen]
class PostRoute extends PageRouteInfo<void> {
  const PostRoute({List<PageRouteInfo>? children})
      : super(
          PostRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PostScreen();
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterScreen();
    },
  );
}

/// generated route for
/// [SelectCountryScreen]
class SelectCountryRoute extends PageRouteInfo<void> {
  const SelectCountryRoute({List<PageRouteInfo>? children})
      : super(
          SelectCountryRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectCountryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SelectCountryScreen();
    },
  );
}

/// generated route for
/// [SettingScreen]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingScreen();
    },
  );
}

/// generated route for
/// [TrendingScreen]
class TrendingRoute extends PageRouteInfo<void> {
  const TrendingRoute({List<PageRouteInfo>? children})
      : super(
          TrendingRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrendingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TrendingScreen();
    },
  );
}

/// generated route for
/// [VisitProfileAuthorScreen]
class VisitProfileAuthorRoute extends PageRouteInfo<void> {
  const VisitProfileAuthorRoute({List<PageRouteInfo>? children})
      : super(
          VisitProfileAuthorRoute.name,
          initialChildren: children,
        );

  static const String name = 'VisitProfileAuthorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const VisitProfileAuthorScreen();
    },
  );
}
