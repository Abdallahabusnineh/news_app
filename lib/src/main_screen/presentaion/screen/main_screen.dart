import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';

import '../../../home/presentation/screen/home_screen.dart';
import '../providers/navigation_bar_providers.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);

    final bodies = [
      const HomeScreen(),
      const Center(
        child: Text('Hello From explore Screen'),
      ),
      const Center(
        child: Text('Hello From Bookmark Screen'),
      ),
      const Center(
        child: Text('Hello From Profile Screen'),
      ),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavbar,
        fixedColor: AppColors.primaryColor,
        backgroundColor: AppColors.whiteColor,
        type: BottomNavigationBarType.fixed,
        onTap: (value) => ref
            .read(indexBottomNavbarProvider.notifier)
            .update((state) => value),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), label: 'Bookmark'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_circle_outlined), label: 'Profile'),
        ],
      ),
      body: bodies[indexBottomNavbar],
    );
  }
}
