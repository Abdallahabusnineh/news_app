import 'package:flutter/material.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/font_style.dart';

ThemeData buildThemeData() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      error: AppColors.errorColor,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: buildTextTheme(),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      titleTextStyle: AppFontStyle.fontSize16W600ColorBlack(),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      buttonColor: AppColors.primaryColor,
    ),
  );
}

buildTextTheme() {
  return TextTheme(
   bodyLarge: AppFontStyle.fontSize48W700(),
    bodyMedium: AppFontStyle.fontSize16W600ColorBlack(),

  );
}
