import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/src/auth/presentation/screen/login/login_screen.dart';
import 'package:news_app/src/main_screen/presentaion/screen/main_screen.dart';
import 'package:news_app/src/notification/presentation/screen/notification_screen.dart';


import 'package:news_app/src/onboarding_screen/initial_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext , Orientation , ScreenType ) {
        return  MaterialApp(

          title: 'Flutter Demo',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'),
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.whiteColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.whiteColor,
              elevation: 0.0,
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home:      const InitialScreen()
        );
      },
    );
  }
}
