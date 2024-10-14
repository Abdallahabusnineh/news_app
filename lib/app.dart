import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/theme/mode_theme/dark_theme.dart';
import 'package:news_app/shared/core/theme/mode_theme/light_theme.dart';
import 'package:news_app/shared/core/theme/mode_theme/provider_mode_theme.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/src/onboarding_screen/initial_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider); // Get the current theme mode
print('token is ${AppConstant.token}');

    return ResponsiveSizer(
      builder: (BuildContext , Orientation , ScreenType ) {
        return  MaterialApp(
          title: 'Flutter Demo',
            locale:  Locale(AppConstant.lang),
          theme: buildLightTheme(),
          darkTheme: buildDarkTheme(),
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          home:  const InitialScreen(),

        );
      },
    );
  }
}

