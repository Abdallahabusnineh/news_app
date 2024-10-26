import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/src/new_sources/presentation/providers/newsource_notifier.dart';
import 'package:news_app/src/notification/data/models/notification_models.dart';
import 'package:news_app/src/notification/presentation/providers/notification_notifier.dart';
import 'package:news_app/src/visit_profile_author/presentation/provider/profile_author_notifier.dart';
import 'package:news_app/src/visit_profile_author/presentation/screen/visit_profile_author_screen.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //get profile notifier
    ProfileAuthorNotifier profileAuthorNotifier=ref.watch(profileAuthorProvider);

    NotificationNotifier notificationNotifier =
        ref.watch(notificationChangeNotifierProvider);
    NewsourceNotifier newSourceNotifier =ref.watch(newSourceChangeNotifierProviderTest);
    var notificationByDate = notificationNotifier.groupedNotifications;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification',
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: notificationNotifier.isLoading ? const Center(
        child: SpinKitFadingCircle(
          color: AppColors.primaryColor,
        ),
      ) :RefreshIndicator(
        onRefresh: () {
          return notificationNotifier.getNotifications();

        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Expanded(
                child:  notificationByDate.isEmpty ?FadeInLeft(
                  duration: const Duration(milliseconds: 500),
                  child: const Center(
                    child: Text(
                      'No notifications found',
                    ),
                  ),
                ):ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: notificationByDate.length,
                  itemBuilder: (BuildContext context, int index) {
                    String date = notificationByDate.keys.elementAt(index);
                    List<NotificationModels> notificationsForDate =
                        notificationByDate[date]!;


                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Date Header
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            date,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
                        )),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: notificationsForDate.length,
                            itemBuilder: (context, notificationIndex) {
                              bool isFollowing = newSourceNotifier.sources[notificationNotifier.groupedNotifications[date]![notificationIndex].notifierId].isFollowed;
                              NotificationModels notificationByDate =
                              notificationsForDate[notificationIndex];
                              return Dismissible(
                                background: Container(
                                  decoration:
                                  BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.delete,
                                        size: 40,
                                        color: AppColors.whiteColor,
                                      ),
                                    ],
                                  ),
                                ),
                                key:ValueKey<int>(notificationIndex),
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) {
                                  print('id is ${notificationByDate.newsId}');
                                  notificationNotifier
                                      .deleteNotificationById(notificationByDate.newsId);
                                  notificationsForDate.removeWhere((element) => element.newsId == notificationByDate.newsId);
                                          },
                                child: Container(
                                  padding: EdgeInsets.all(3.w),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).brightness == Brightness.light?const Color(0xFFEEF1F4):const Color(0xFF3A3B3C),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          profileAuthorNotifier.getProfileAuthor(notificationByDate.notifierId);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const VisitProfileAuthorScreen(),
                                            ),
                                          );
                                        },
                                        child: CircleAvatar(
                                          backgroundImage: const AssetImage(
                                            AppAssets.notificationImg,
                                          ),
                                          radius: 25.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text.rich(
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: notificationByDate.notifierUserName,
                                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
                                                  ),
                                                  WidgetSpan(
                                                    child: SizedBox(
                                                      width: 1.w,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                    '${notificationNotifier.groupedNotifications[date]![notificationIndex].notifierId}',
                                                    style: Theme.of(context).textTheme.bodyMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              notificationByDate.createdAt,
                                              style: Theme.of(context).textTheme.labelSmall,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      notificationByDate.type == 'follow_request'
                                          ?isFollowing?Container(
                                        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                          color:  AppColors.primaryColor,
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          'Following',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(color: AppColors.whiteColor),
                                        ),
                                      ):Container(
                                        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.primaryColor
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.add, color: AppColors.primaryColor),
                                            Text(
                                              'Follow',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(color: AppColors.primaryColor),
                                            ),
                                          ],
                                        ),
                                      )
                                          :const SizedBox()

                                    ],
                                  ),
                                ),
                              );
                            }, separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 2.h,
                          );
                        },)
                      ],
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
