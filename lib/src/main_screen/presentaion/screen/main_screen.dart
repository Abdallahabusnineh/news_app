import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/bookmark/presentation/screen/bookmark_screen.dart';
import 'package:news_app/src/explore/presentation/screen/explore_screen.dart';
import 'package:news_app/src/home/presentation/screen/home_screen.dart';
import 'package:news_app/src/main_screen/presentaion/providers/navigation_bar_providers.dart';
import 'package:news_app/src/profile/presentation/screen/profile_screen.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);
    final bodies = [
      const HomeScreen(),
      const ExploreScreen(),
      const BookmarkScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavbar,
        type: BottomNavigationBarType.fixed,
        onTap: (value) => ref
            .read(indexBottomNavbarProvider.notifier)
            .update((state) => value),
        items: [
          BottomNavigationBarItem(icon: Icon(indexBottomNavbar == 0 ? Icons.home : Icons.home_outlined), label: 'Home'),
           BottomNavigationBarItem(
              icon: Icon(indexBottomNavbar == 1 ? Icons.explore : Icons.explore_outlined), label: 'Explore'),
           BottomNavigationBarItem(
              icon: Icon(indexBottomNavbar == 2 ? Icons.bookmark : Icons.bookmark_outline), label: 'Bookmark'),
           BottomNavigationBarItem(
              icon: Icon(indexBottomNavbar == 3 ? Icons.person : Icons.person_outline), label: 'Profile'),
        ],
      ),
      body: bodies[indexBottomNavbar],
    );
  }
}
