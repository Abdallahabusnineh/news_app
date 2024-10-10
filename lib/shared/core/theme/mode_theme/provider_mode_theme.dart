
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
      (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system);

  void toggleTheme(ThemeMode themeMode) {
    state = themeMode;
  }

}
