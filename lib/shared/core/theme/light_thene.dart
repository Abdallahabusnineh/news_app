
import 'package:flutter/material.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
/*

ThemeData lightTheme() => ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.secondaryColor,
    primary: AppColors.secondaryColor,
    secondary: AppColors.secondaryColor,
    tertiary: AppColors.whiteColor,
  ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      fontFamily: 'poppins',
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: true,
    );
*/
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  hintColor: Colors.blueAccent,
  // Define additional light theme properties here
);
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey[900],
  hintColor: Colors.blueAccent,

  // Define additional dark theme properties here
);