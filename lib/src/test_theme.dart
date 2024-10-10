import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/core/theme/mode_theme/provider_mode_theme.dart';

class TestThemeMode extends ConsumerWidget {
  const TestThemeMode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeNotifierProvider.notifier); // Access ThemeNotifier

    return Scaffold(
      appBar: AppBar(title: const Text('Theme with Riverpod')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select Theme Mode', style: Theme.of(context).textTheme.titleLarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => themeNotifier.toggleTheme(ThemeMode.light),
                    child: const Text('Light Mode'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => themeNotifier.toggleTheme(ThemeMode.dark),
                    child: const Text('Dark Mode'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => themeNotifier.toggleTheme(ThemeMode.system),
                    child: const Text('System Mode'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


