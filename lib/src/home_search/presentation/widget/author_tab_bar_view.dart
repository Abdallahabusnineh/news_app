import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/shared_widget/autho_builder.dart';
import 'package:news_app/src/new_sources/presentation/providers/newsource_notifier.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthorTabBarView extends ConsumerWidget {
  const AuthorTabBarView({super.key});

  @override
  Widget build(BuildContext context, ref) {

     NewsourceNotifier newsourceNotifier =
        ref.watch(newSourceChangeNotifierProviderTest);
    var items = newsourceNotifier.sources;
    return newsourceNotifier.isLoading
        ? const Center(
            child: SpinKitSquareCircle(
              color: AppColors.primaryColor,
            ),
          )
        : ListView.separated(
      itemBuilder: (context, i) => AuthorBuilder(
        authorName: items[i].userName,
        authorImg: AppAssets.trendingCircleAvatar,
        subtitle: '${items[i].followersCount} Followers',
        id: items[i].id,
        isFollowed: items[i].isFollowed,
      ),
            separatorBuilder: (context, index) => SizedBox(height: 2.h),
            itemCount: items.length,
          );
  }
}
