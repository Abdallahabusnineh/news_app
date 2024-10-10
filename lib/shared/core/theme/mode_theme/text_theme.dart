import 'package:flutter/material.dart';
import 'package:news_app/shared/core/utils/font_style.dart';


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
      displayMedium: AppFontStyle.w400ColorLightBlue(fontSize: 14)
  ,displayLarge: AppFontStyle.w600ColorBlue(fontSize: 16)
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
      labelSmall: AppFontStyle.w400ColorExtraLightPurple(fontSize: 13),
      titleLarge: AppFontStyle.w600(fontSize: 20),
      titleMedium: AppFontStyle.w600(fontSize: 16),
      titleSmall: AppFontStyle.w600(fontSize: 14),
      displaySmall: AppFontStyle.w600ColorLightGrey(fontSize: 13),
      displayMedium: AppFontStyle.w400ColorLightBlue(fontSize: 14),
displayLarge: AppFontStyle.w600ColorBlue(fontSize: 16),
  );
}
