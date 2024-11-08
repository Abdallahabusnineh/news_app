import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/theme/mode_theme/provider_mode_theme.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:news_app/src/auth/presentation/providers/logout/logout_provider.dart';
import 'package:news_app/src/notification/presentation/providers/notification_notifier.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:auto_route/auto_route.dart';
@RoutePage()
class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NotificationNotifier notificationNotifier =ref.watch(notificationChangeNotifierProvider);
    final themeNotifier =
        ref.read(themeNotifierProvider.notifier); // Access ThemeNotifier
    LogoutChangeNotifier logoutChangeNotifier =
        ref.read(logoutChangeNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 5.w,
          right: 5.w,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                notificationNotifier.getNotifications();
                appRouter.push(const NotificationRoute());
              },
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.iconNotifications,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : AppColors.whiteColor,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    'Notification',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : AppColors.whiteColor,
                    size: 5.w,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.lock_outline_rounded,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : AppColors.whiteColor,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  'Security',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : AppColors.whiteColor,
                  size: 5.w,
                )
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.help_outline,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : AppColors.whiteColor,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  'Help',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : AppColors.whiteColor,
                  size: 5.w,
                )
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.dark_mode_outlined,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : AppColors.whiteColor,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  'Dark Mode',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Switch(
                  activeColor: AppColors.primaryColor,
                  thumbColor: WidgetStateProperty.all(Colors.white),
                  value: themeNotifier.isDarkMode ? true : false,
                  onChanged: (value) {
                    themeNotifier.toggleTheme(value);
                  },
                )
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            InkWell(
              onTap: () {
                AwesomeDialog(
                  context: context,
                  dialogBackgroundColor:
                      Theme.of(context).brightness == Brightness.light
                          ? AppColors.whiteColor
                          : Colors.white10,
                  dialogType: DialogType.warning,
                  animType: AnimType.scale,
                  title: 'Logout',
                  desc: 'Are you sure want to logout?',
                  btnCancelOnPress: () {

                  },
                  btnOkOnPress: () {
                    logoutChangeNotifier.logout();

                  },
                ).show();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : AppColors.whiteColor,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    'Logout',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
