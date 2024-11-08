import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:news_app/src/new_sources/presentation/providers/newsource_notifier.dart';
import 'package:news_app/src/visit_profile_author/presentation/provider/profile_author_notifier.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class AuthorBuilder extends ConsumerWidget {
   AuthorBuilder(
      {super.key,
      required this.authorName,
      required this.authorImg,
      required this.subtitle,
      required this.id,
        required this.isFollowed
    });

  final String authorName, authorImg, subtitle;

  final  int id;
  bool isFollowed = false;


  @override
  Widget build(BuildContext context,ref) {
    ProfileAuthorNotifier profileAuthorNotifier=ref.watch(profileAuthorProvider);

    NewsourceNotifier notifier =
    ref.watch(newSourceChangeNotifierProviderTest);

    return InkWell(
      onTap: () {
        print('tapped $id');
        profileAuthorNotifier.getProfileAuthor(id);
       appRouter.push(const VisitProfileAuthorRoute());
      },
      child: Row(children: [

        CircleAvatar(
          backgroundImage: AssetImage(authorImg),
          radius: 25.sp,
        ),
        SizedBox(
          width: 1.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              authorName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 1.h,
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
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.primaryColor),
                child: TextButton(
                  onPressed: () {
                    notifier.follow(id);
                  },
                  child: Text('Following',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white)),
                ))
            : Container(
            width: 100,
                height: 40,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
      border: Border.all(color: AppColors.primaryColor),
                ),
                child: TextButton(
                  onPressed: () {
                    notifier.follow(id);
                  },
                  child: Row(
                    children: [
                      Flexible(
                        child: Icon(
                          Icons.add,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text('Follow',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: AppColors.primaryColor)),
                    ],
                  )
                )),
      ]),
    );
  }
}
