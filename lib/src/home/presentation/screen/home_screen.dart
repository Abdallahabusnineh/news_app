import 'package:flutter/material.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder.dart';
import 'package:news_app/src/home/presentation/screen/widget/home_widget.dart';
import 'package:news_app/src/home_search/presentation/screen/home_search_screen.dart';
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
                color: Theme.of(context).brightness == Brightness.light?AppColors.whiteColor:const Color(0xFF3A3B3C),
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
                  AppAssets.iconNotifications,color: Theme.of(context).brightness == Brightness.light?AppColors.blackColor:AppColors.whiteColor,
                )),
          ),
        ],
      )),
      body: ListView(
        padding: EdgeInsets.all(3.0.w),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SearchBar(

            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) {
                return const HomeSearchScreen();
              }));
            },
            hintText: 'Search ',
            leading:
            Image.asset(AppAssets.iconSearch,color: Theme.of(context).brightness == Brightness.light?AppColors.lightPurpleColor:AppColors.lightGreyColor,),
            trailing: List.filled(1, Image.asset(AppAssets.iconFilters,color: Theme.of(context).brightness == Brightness.light?AppColors.lightPurpleColor:AppColors.lightGreyColor),
                growable: true),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending',
                style: Theme.of(context).textTheme.titleMedium,
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
                  Theme.of(context).textTheme.labelMedium,
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
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'see all',
                  style:
                  Theme.of(context).textTheme.labelMedium,
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
                textStyle: Theme.of(context).textTheme.bodyMedium,
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
                          ? Theme.of(context).textTheme.bodyMedium
                          : Theme.of(context).textTheme.bodySmall,
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
