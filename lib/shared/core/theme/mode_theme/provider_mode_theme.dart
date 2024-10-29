import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/abstraction/cash_helper.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/shared/core/utils/font_style.dart';

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(AppConstant.themeMode ? ThemeMode.dark : ThemeMode.light);
  bool isDarkMode = AppConstant.themeMode;

  Future<void> toggleTheme(bool isDark) async {
    state = isDark ? ThemeMode.dark : ThemeMode.light;
    await CacheHelper.saveData(key: 'themeMode', value: isDark);
    isDarkMode = isDark;

  }

  ThemeData buildLightTheme() {
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
checkboxTheme: const CheckboxThemeData(
  splashRadius: 20,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(3),
      )
  ),
  checkColor: WidgetStatePropertyAll(AppColors.whiteColor),
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

          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),  // Focus color
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),  // Error color
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),  // Focused error color
          ),

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
              padding: WidgetStateProperty.all(const EdgeInsets.only(bottom: 13, top: 13, left: 24, right: 24)),
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

        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),  // Focus color
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),  // Error color
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),  // Focused error color
        ),
        border: OutlineInputBorder(
          gapPadding: 10,
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(color: AppColors.lightPurpleColor),
        ),
      ),
      checkboxTheme: const CheckboxThemeData(
        splashRadius: 20,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(3),
            )
        ),
        checkColor: WidgetStatePropertyAll(AppColors.textFormFieldDarkMode),
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
          padding: WidgetStateProperty.all(const EdgeInsets.only(bottom: 13, top: 13, left: 24, right: 24)),
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
