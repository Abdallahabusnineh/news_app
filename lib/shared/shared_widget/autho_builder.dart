import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/src/new_sources/presentation/providers/newsource_notifier.dart';


class AuthorBuilder extends ConsumerWidget {
  const AuthorBuilder(
      {super.key,
      required this.authorName,
      required this.authorImg,
      required this.subtitle,
      required this.index,
    });

  final String authorName, authorImg, subtitle;

  final  int index;


  @override
  Widget build(BuildContext context,ref) {
    NewsourceNotifier notifier =
    ref.watch(newSourceChangeNotifierProviderTest);
    bool isFollowed = notifier.userFollowing(notifier.sources[index].id);

    return Row(children: [
      CircleAvatar(
        backgroundImage: AssetImage(authorImg),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            authorName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.labelMedium,
          )
        ],
      ),
      const Spacer(),
      isFollowed
          ? Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.primaryColor),
              child: TextButton(
                onPressed: () {
                  notifier.follow(index+1);
                },
                child: Text('Following',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white)),
              ))
          : Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
border: Border.all(color: AppColors.primaryColor),
              ),
              child: TextButton(
                onPressed: () {
                  notifier.follow(index+1);
                },
                child: Text('Follow',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.primaryColor)),
              )),
    ]);
  }
}