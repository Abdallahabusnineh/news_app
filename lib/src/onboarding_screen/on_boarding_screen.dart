import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:news_app/shared/core/utils/font_style.dart';
import 'package:news_app/src/onboarding_screen/widget/on_boarding_1.dart';
import 'package:news_app/src/onboarding_screen/widget/on_boarding_2.dart';
import 'package:news_app/src/onboarding_screen/widget/on_boarding_3.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  bool onFirstPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            onLastPage = (index == 2);
            onFirstPage = (index == 0);
          });
        },
        children: const [
          FirstOnBoardingScreen(),
          SecondOnBoardingScreen(),
          ThirdOnBoardingScreen(),
        ],
      ),
      bottomSheet: Container(

          padding:
              EdgeInsets.only(left: 24, right: 24, bottom: 15.sp, top: 5.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: JumpingDotEffect(
                  activeDotColor: AppColors.primaryColor,
                  dotHeight: 2.5.h,
                  dotWidth: 2.5.h,
                  jumpScale: 1.5,
                  verticalOffset: 10,
                ),
                onDotClicked: (index) {},
              ),
              Row(children: [
                onFirstPage
                    ? const SizedBox()
                    : TextButton(
                        onPressed: () {
                          _controller.previousPage(
                              duration: const Duration(microseconds: 400),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          'Back',
                          style: AppFontStyle.w600ColorLightGrey(fontSize: 16),
                        ),
                      ),
                TextButton(
                  onPressed: () {
                    _controller.nextPage(
                        duration: const Duration(microseconds: 400),
                        curve: Curves.easeIn);
                    onLastPage
                        ? appRouter.replace(const LoginRoute())
                        : null;
                  },
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(const EdgeInsets.only(bottom: 13, top: 13, left: 24, right: 24)),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
                    foregroundColor:
                        WidgetStateProperty.all(AppColors.whiteColor),
                    backgroundColor:
                        WidgetStateProperty.all(AppColors.primaryColor),
                  ),
                  child: onLastPage
                      ? const Text('Get Started')
                      : const Text('Next'),
                )
              ])
            ],
          )),
    );
  }
}
