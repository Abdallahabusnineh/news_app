import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../shared/core/utils/app_assets.dart';
import '../../../shared/core/utils/font_style.dart';


class ThirdOnBoardingScreen extends StatelessWidget {
  const ThirdOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            height: MediaQuery.of(context).size.height*0.6,
            width: double.infinity,
            AppAssets.lastImgOnBoardingScreen,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 24,right: 24,bottom: 8,top: 24),
              child: Column(
                children: [
                  Text(
                    'Lorem Ipsum is simply dummy',
                    style: AppFontStyle.w700ColorBlack(fontSize:24),
                    maxLines: 2,
                  ),
                  Expanded(
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: AppFontStyle.w400ColorLightPurple(fontSize:16),
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
