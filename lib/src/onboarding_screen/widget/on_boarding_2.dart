import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../shared/core/utils/app_assets.dart';
import '../../../shared/core/utils/font_style.dart';


class SecondOnBoardingScreen extends StatelessWidget {
  const SecondOnBoardingScreen({super.key});

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
            AppAssets.secondImgOnBoardingScreen,
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
