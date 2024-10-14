import 'package:flutter/material.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/theme/mode_theme/text_theme.dart';

import 'package:news_app/shared/core/utils/font_style.dart';

ThemeData buildDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    colorSchemeSeed: AppColors.primaryColor,
    brightness: Brightness.dark,
    fontFamily: 'poppins',
    textTheme: buildTextThemeDark(),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme:  AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppFontStyle.w600(fontSize: 16),
      iconTheme: const IconThemeData(
        color: AppColors.lightGreyColor
      )
    ),

    searchBarTheme: SearchBarThemeData(
      textStyle: WidgetStatePropertyAll(
        AppFontStyle.w600ColorLightGrey(fontSize: 14),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide.none
        ),
      ),
      backgroundColor: const WidgetStatePropertyAll(AppColors.textFormFieldDarkMode),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.black
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.lightGreyColor,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.lightGreyColor
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
          foregroundColor: WidgetStateProperty.all(AppColors.whiteColor),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)))),
    ),
  );
}
/*scaffoldBackgroundColor: AppColors.blackColor,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryColor,
        secondary: AppColors.primaryColor,
        error: AppColors.errorColor,
      ),
      fontFamily: 'poppins',
      textTheme: buildTextThemeLight(),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            backgroundColor: AppColors.primaryColor),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        elevation: 0,
        backgroundColor: AppColors.blackColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.blackColor,
        foregroundColor: AppColors.whiteColor,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: AppFontStyle.w600(fontSize: 16),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.blackColor, elevation: 0),
      searchBarTheme: SearchBarThemeData(
          textStyle: WidgetStatePropertyAll(
            AppFontStyle.w600(fontSize: 14),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor:
              const WidgetStatePropertyAll(AppColors.textFormFieldDarkMode)));*/
