import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/font_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class FirstOnBoardingScreen extends StatelessWidget {
  const FirstOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            height: MediaQuery.of(context).size.height*0.63,
            width: double.infinity,
            AppAssets.firstImgOnBoardingScreen,
            fit: BoxFit.cover,
          ),
       Expanded(
         child: Container(
           padding: EdgeInsets.only(left: 24,right: 24,bottom: 8,top: 24),
           child: Column(
             children: [
               Text(
                 'Lorem Ipsum is simply dummy',
                 style: AppFontStyle.fontSize24W700(),
                 maxLines: 2,
               ),
               Expanded(
                 child: Text(
                   'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                   style: AppFontStyle.fontSize16W400ColorLightPurple(),
                   maxLines: 10,
                 ),
               ),
             ],
           ),
         ),
       )


        ],
      ),
    );
  }
}
