import 'package:flutter/material.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/font_style.dart';

ThemeData buildThemeData() {
  return ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ),
    primaryColor: AppColors.primaryColor,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      error: AppColors.errorColor,
    ),
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: AppColors.whiteColor,

    textTheme: buildTextTheme(),
    inputDecorationTheme:  InputDecorationTheme(

      border: OutlineInputBorder(
        borderSide: const BorderSide(
            color: Color(0xFF4E4B66), width: 1),
        borderRadius: BorderRadius.circular(6.0),
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      titleTextStyle: AppFontStyle.w600ColorBlack(fontSize: 16),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      buttonColor: AppColors.primaryColor,
    ),
  );
}

buildTextTheme() {
  return TextTheme(
  );
}
