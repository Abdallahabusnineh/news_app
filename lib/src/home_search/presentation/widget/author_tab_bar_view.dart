import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/shared_widget/autho_builder.dart';
import 'package:news_app/shared/shared_widget/image_loader.dart';
import 'package:news_app/src/new_sources/presentation/providers/newsource_notifier.dart';
import 'package:news_app/src/visit_profile_author/presentation/provider/profile_author_notifier.dart';
import 'package:news_app/src/visit_profile_author/presentation/screen/visit_profile_author_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthorTabBarView extends ConsumerWidget {
  const AuthorTabBarView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    NewsourceNotifier notifier =
    ref.watch(newSourceChangeNotifierProviderTest);
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
            itemBuilder: (context, i) {
              bool isFollowed = notifier.sources[notifier.sources[i].id].isFollowed;
              return InkWell(
              onTap: () {
                print('tapped ${newsourceNotifier.sources[i].id}');
               /* profileAuthorNotifier.getProfileAuthor(getPostInfoModel.userId);*/
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VisitProfileAuthorScreen(),
                  ),
                );
              },
              child: Row(children: [

                FancyImageLoader(
                  path: items[i].userName??AppAssets.topicImg,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[i].userName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      items[i].userName.substring(0, 10),
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
                        notifier.follow(newsourceNotifier.sources[i].id);
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
                        notifier.follow(newsourceNotifier.sources[i].id);
                      },
                      child: Text('Follow',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: AppColors.primaryColor)),
                    )),
              ]),
            );
            },
            separatorBuilder: (context, index) => SizedBox(height: 2.h),
            itemCount: items.length,
          );
  }
}
