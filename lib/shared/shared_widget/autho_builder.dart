import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/src/new_sources/presentation/providers/newsource_notifier.dart';
import 'package:news_app/src/visit_profile_author/presentation/provider/profile_author_notifier.dart';
import 'package:news_app/src/visit_profile_author/presentation/screen/visit_profile_author_screen.dart';


class AuthorBuilder extends ConsumerWidget {
  const AuthorBuilder(
      {super.key,
      required this.authorName,
      required this.authorImg,
      required this.subtitle,
      required this.id,
    });

  final String authorName, authorImg, subtitle;

  final  int id;


  @override
  Widget build(BuildContext context,ref) {
    ProfileAuthorNotifier profileAuthorNotifier=ref.watch(profileAuthorProvider);

    NewsourceNotifier notifier =
    ref.watch(newSourceChangeNotifierProviderTest);
    bool isFollowed = notifier.sources[id].isFollowed;

    return InkWell(
      onTap: () {
        print('tapped ${id}');
        profileAuthorNotifier.getProfileAuthor(id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const VisitProfileAuthorScreen(),
          ),
        );
      },
      child: Row(children: [

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
              subtitle.substring(0, 10),
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
                    notifier.follow(id+1);
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
                    notifier.follow(id+1);
                  },
                  child: Text('Follow',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppColors.primaryColor)),
                )),
      ]),
    );
  }
}
