import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:news_app/src/main_screen/presentaion/screen/main_screen.dart';
import 'on_boarding_screen.dart';

@RoutePage()
class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    // Timer();
    Future.delayed(const Duration(seconds: 2), () {
      if (AppConstant.token == "") {
        appRouter.pushAndPopUntil(
          const OnBoardingRoute(),
          predicate: (route) => false,
        );
      } else {
        appRouter.pushAndPopUntil(
          const MainRoute(),
          predicate: (route) => false,
        );
      }
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
