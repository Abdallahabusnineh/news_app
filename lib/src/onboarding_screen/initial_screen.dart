import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/src/main_screen/presentaion/screen/main_screen.dart';
import 'on_boarding_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    // Timer();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                startPage()), // Call nextPage() to your main page
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppAssets.logo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget startPage() {
    if (AppConstant.token == "") {
      return const OnBoardingScreen();
    } else {
      return const MainScreen();
    }
  }
}
