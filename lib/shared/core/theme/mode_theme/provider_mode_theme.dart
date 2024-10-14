
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



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

}
