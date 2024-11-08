import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/error/custom_error.dart';
import 'package:news_app/shared/core/theme/mode_theme/provider_mode_theme.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import 'shared/core/utils/app_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(themeNotifierProvider.notifier);
    final themeMode = ref.watch(themeNotifierProvider);
    // Get the current theme mode
    return ResponsiveSizer(
      builder: (BuildContext c, Orientation o, ScreenType st) {
        return MaterialApp.router(
          routerConfig: appRouter.config(),

          title: 'Flutter Demo',
          locale: Locale(AppConstant.lang),
          theme: notifier.buildLightTheme(),
          darkTheme: notifier.buildDarkTheme(),
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
