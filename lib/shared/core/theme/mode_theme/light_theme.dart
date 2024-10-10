import 'package:flutter/material.dart';

import 'package:news_app/shared/core/theme/mode_theme/text_theme.dart';
import 'package:news_app/shared/core/utils/font_style.dart';

import '../app_colors.dart';

ThemeData buildLightTheme() {
  /*return ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.whiteColor,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      error: AppColors.errorColor,
    ),
    fontFamily: 'poppins',
    textTheme: buildTextThemeLight(),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      foregroundColor: AppColors.blackColor,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: AppFontStyle.w600(fontSize: 16),
    ),
    searchBarTheme: SearchBarThemeData(
      textStyle: WidgetStatePropertyAll(
        AppFontStyle.w400ColorExtraLightPurple(fontSize: 14),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      backgroundColor: const WidgetStatePropertyAll(AppColors.whiteColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF4E4B66), width: 1),
        borderRadius: BorderRadius.circular(6.0),
      ),
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      elevation: 0,
      backgroundColor: AppColors.whiteColor,
    ),
  );*/

  return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      fontFamily: 'poppins',
      textTheme: buildTextThemeLight(),
      brightness: Brightness.light,
      appBarTheme:  AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        titleTextStyle: AppFontStyle.w600(fontSize: 16).copyWith(
          color: AppColors.blackColor
        ),
      ),
      searchBarTheme: SearchBarThemeData(
        textStyle: WidgetStatePropertyAll(
          AppFontStyle.w400ColorExtraLightPurple(fontSize: 14),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        backgroundColor:  const WidgetStatePropertyAll(AppColors.whiteColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: AppColors.blackColor.withOpacity(0.5),
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(

        backgroundColor: AppColors.whiteColor,
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.whiteColor,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.blackColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
            foregroundColor: WidgetStateProperty.all(AppColors.whiteColor),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)))),
      ));
}

/*
  return ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    colorScheme:  ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      error: AppColors.errorColor,
      surface: AppColors.whiteColor,

    ),

  );
*/
