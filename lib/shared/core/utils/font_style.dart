import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppFontStyle {
  static TextStyle w700({required double fontSize}) {
    return TextStyle(
      fontSize: fontSize,
      letterSpacing: 0.12,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle w600({required double fontSize}) {
    return  TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.12,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle w400({required double fontSize}) {
    return  TextStyle(

      fontSize: fontSize,

      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    );
  }

  //***************************************     blue     ***************************************
  static TextStyle w700ColorBlue({required double fontSize,}) {
    return  TextStyle(
      fontSize: fontSize,
      letterSpacing: 0.12,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryColor,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle w600ColorBlue({required double fontSize}) {
    return  TextStyle(
      fontSize: fontSize,
      letterSpacing: 0.12,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor,
      overflow: TextOverflow.ellipsis,
    );
  }

  //***************************************    light blue     ***************************************

  static TextStyle w400ColorLightBlue({required double fontSize}) {
    return  TextStyle(
      color:AppColors.lightBlueColor,
      fontSize: fontSize,

      letterSpacing: .12,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    );
  }
  
  
  //***************************************    light purple     ***************************************

  static TextStyle w600ColorLightPurple({required double fontSize}) {
    return  TextStyle(
      color:AppColors.lightPurpleColor,
      fontSize: fontSize,

      fontWeight: FontWeight.w600,
      letterSpacing: 0.12,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle w400ColorLightPurple({required double fontSize}) {
    return  TextStyle(
      color:AppColors.lightPurpleColor,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.12,
      overflow: TextOverflow.ellipsis,
    );
  }


  //***************************************   Extra light purple     ***************************************

  static TextStyle w400ColorExtraLightPurple({required double fontSize}) {
    return  TextStyle(
      color:AppColors.extraLightPurpleColor,
      fontSize: fontSize,
      
      letterSpacing: .12,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    );
  }

  //***************************************   Extra light Grey     ***************************************

  static TextStyle w600ColorLightGrey({required double fontSize}) {
    return  TextStyle(
      color:AppColors.lightGreyColor,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.12,
      overflow: TextOverflow.ellipsis,


    );
  }
  static TextStyle w400ColorLightGrey({required double fontSize}) {
    return  TextStyle(
      color:AppColors.lightGreyColor,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.12,
      overflow: TextOverflow.ellipsis,


    );
  }
}