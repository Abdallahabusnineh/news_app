import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder.dart';
import 'package:news_app/src/visit_profile_author/presentation/provider/profile_author_notifier.dart';

class NewsByUserIdTabBar extends ConsumerWidget {
  const NewsByUserIdTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProfileAuthorNotifier profileAuthorNotifier =
        ref.watch(profileAuthorProvider);
    var items = profileAuthorNotifier.newsByUserId;
    return items.isEmpty ?  Center(child: Text('No News Founded',style: Theme.of(context).textTheme.titleLarge,)) : ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return PostBuilder(
          isTrendingPost: false,
          postImage: AppAssets.trendingImg,
          postTitle: items[index].title,
          postContent: items[index].content,
          postAuthorName: items[index].userName,
          postAuthorImg: AppAssets.trendingCircleAvatar,
          postTime: items[index].createdAt,
          postId: items[index].postId,
        );
      },
    );
  }
}