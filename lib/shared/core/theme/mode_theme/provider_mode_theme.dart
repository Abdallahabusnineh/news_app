import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/font_style.dart';

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system);
  bool isDarkMode = false;

  void toggleTheme(bool isDark) {
    state = isDark ? ThemeMode.dark : ThemeMode.light;
    isDarkMode = isDark;
  }

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
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          centerTitle: true,
          titleTextStyle: AppFontStyle.w600(fontSize: 16)
              .copyWith(color: AppColors.blackColor),
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
            unselectedItemColor: AppColors.lightPurpleColor),
        iconTheme: const IconThemeData(color: AppColors.lightPurpleColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
              foregroundColor: WidgetStateProperty.all(AppColors.whiteColor),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)))),
        ));
  }

  ThemeData buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: AppColors.primaryColor,
      brightness: Brightness.dark,
      fontFamily: 'poppins',
      textTheme: buildTextThemeDark(),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: AppFontStyle.w600(fontSize: 16),
          iconTheme: const IconThemeData(color: AppColors.lightGreyColor)),
      searchBarTheme: SearchBarThemeData(
        textStyle: WidgetStatePropertyAll(
          AppFontStyle.w600ColorLightGrey(fontSize: 14),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), side: BorderSide.none),
        ),
        backgroundColor:
            const WidgetStatePropertyAll(AppColors.textFormFieldDarkMode),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.black),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.lightGreyColor,
      ),
      iconTheme: const IconThemeData(color: AppColors.lightGreyColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
            foregroundColor: WidgetStateProperty.all(AppColors.whiteColor),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)))),
      ),
    );
  }

  TextTheme buildTextThemeLight() {
    return TextTheme(
      bodyLarge: AppFontStyle.w700(fontSize: 24),
      bodyMedium: AppFontStyle.w400(fontSize: 16),
      bodySmall: AppFontStyle.w400ColorLightPurple(fontSize: 16),
      headlineLarge: AppFontStyle.w700(fontSize: 48),
      headlineMedium: AppFontStyle.w400ColorLightPurple(fontSize: 20),
      headlineSmall: AppFontStyle.w400ColorLightPurple(fontSize: 14),
      labelLarge: AppFontStyle.w400ColorLightPurple(fontSize: 16),
      labelMedium: AppFontStyle.w400ColorLightPurple(fontSize: 14),
      labelSmall: AppFontStyle.w400ColorExtraLightPurple(fontSize: 13),
      titleLarge: AppFontStyle.w600(fontSize: 20),
      titleMedium: AppFontStyle.w600(fontSize: 16),
      titleSmall: AppFontStyle.w600(fontSize: 14),
      displaySmall: AppFontStyle.w600ColorLightPurple(fontSize: 13),
      displayMedium: AppFontStyle.w400ColorLightBlue(fontSize: 14),
      displayLarge: AppFontStyle.w600ColorBlue(fontSize: 16),
    );
  }

  TextTheme buildTextThemeDark() {
    return TextTheme(
      bodyLarge: AppFontStyle.w700(fontSize: 24),
      bodyMedium: AppFontStyle.w400(fontSize: 16),
      bodySmall: AppFontStyle.w400ColorLightGrey(fontSize: 16),
      headlineLarge: AppFontStyle.w700(fontSize: 48),
      headlineMedium: AppFontStyle.w400ColorLightGrey(fontSize: 20),
      headlineSmall: AppFontStyle.w400ColorLightPurple(fontSize: 14),
      labelLarge: AppFontStyle.w400ColorLightGrey(fontSize: 16),
      labelMedium: AppFontStyle.w400ColorLightGrey(fontSize: 14),
      labelSmall: AppFontStyle.w400ColorLightGrey(fontSize: 13),
      titleLarge: AppFontStyle.w600(fontSize: 20),
      titleMedium: AppFontStyle.w600(fontSize: 16),
      titleSmall: AppFontStyle.w600(fontSize: 14),
      displaySmall: AppFontStyle.w600ColorLightGrey(fontSize: 13),
      displayMedium: AppFontStyle.w400ColorLightBlue(fontSize: 14),
      displayLarge: AppFontStyle.w600ColorBlue(fontSize: 16),
    );
  }
}
