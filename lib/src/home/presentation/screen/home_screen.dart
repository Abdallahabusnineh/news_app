import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/font_style.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder.dart';
import 'package:news_app/shared/shared_widget/search_bar.dart';
import 'package:news_app/src/home/presentation/screen/widget/home_widget.dart';
import 'package:news_app/src/notification/presentation/screen/notification_screen.dart';
import 'package:news_app/src/trending/presentation/screen/trending_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../shared/core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppAssets.logoAppBar,
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor.withOpacity(0.1),
                    offset: const Offset(0, 0),
                    blurRadius: 10,
                  )
                ]),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) {
                    return const NotificationScreen();
                  }));
                },
                icon: Image.asset(
                  AppAssets.iconNotifications,
                )),
          ),
        ],
      )),
      body: ListView(
        padding: EdgeInsets.all(3.0.w),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const CustomSearchBar(
            isHasLeading: true,
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending',
                style: AppFontStyle.w600ColorBlack(fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) {
                    return const TrendingScreen();
                  },));
                },
                child: Text(
                  'see all',
                  style:
                  AppFontStyle.w400ColorLightPurple(fontSize:14),
                ),
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
           PostBuilder(isTrendingPost: true,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest',
                style: AppFontStyle.w600ColorBlack(fontSize: 16),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'see all',
                  style:
                  AppFontStyle.w400ColorLightPurple(fontSize:14),
                ),
              )
            ],
          ),

          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              child: ToggleButtons(
                isSelected: isSelected,
                onPressed: (int index) {},
      // selectedColor: Colors.blue,
                color: Colors.black,
                fillColor: Colors.transparent,
                renderBorder: false,
                textStyle: AppFontStyle.w400ColorBlack(fontSize: 16),
                children: List.generate(labels.length, (index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 1.h, horizontal: 1.w),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isSelected[index]
                              ? AppColors.primaryColor
                              : Colors.transparent,
                        ),
                      ),
                    ),
                    child: Text(
                      labels[index],
                      style: isSelected[index]
                          ? AppFontStyle.w400ColorBlack(fontSize: 16)
                          : AppFontStyle
                          .w400ColorLightPurple(fontSize:16),
                    ),
                  );
                }),
              )),
          SizedBox(
            height: 1.h,
          ),
          PostBuilder(isTrendingPost: false,),
          PostBuilder(isTrendingPost: false,),
          PostBuilder(isTrendingPost: false,),
        ],
      ),
    );
  }
}
