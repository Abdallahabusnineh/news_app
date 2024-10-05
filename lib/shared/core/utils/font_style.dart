import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/app_colors.dart';

class AppFontStyle {
  static TextStyle fontSize48W700() {
    return const TextStyle(
      fontSize: 48,
      fontFamily: 'Poppins',
      letterSpacing: 0.12,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle fontSize48W700ColorBlue() {
    return const TextStyle(
      fontSize: 48,
      fontFamily: 'Poppins',
      letterSpacing: 0.12,
      fontWeight: FontWeight.w700,
      color: AppColors.secondaryColor,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle fontSize14W600ColorBlue() {
    return const TextStyle(
      fontSize: 14,
      fontFamily: 'Poppins',
      letterSpacing: 0.12,
      fontWeight: FontWeight.w600,
      color: AppColors.secondaryColor,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle fontSize16W600ColorBlue() {
    return const TextStyle(
      fontSize: 16,
      fontFamily: 'Poppins',
      letterSpacing: 0.12,
      fontWeight: FontWeight.w600,
      color: AppColors.secondaryColor,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle fontSize16W600ColorBlack() {
    return const TextStyle(
      color:AppColors.blackColor,
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      letterSpacing: 0.12,
      overflow: TextOverflow.ellipsis,


    );
  }
  static TextStyle fontSize24W700() {
    return const TextStyle(
      fontSize: 24,
      fontFamily: 'Poppins',
      letterSpacing: 0.12,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle fontSize20W400ColorLightPurple() {
    return  TextStyle(
      color:Color(0xFF4E4B66),
      fontSize: 20,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      letterSpacing: 0.12,
      overflow: TextOverflow.ellipsis,
    );
  } 
  static TextStyle fontSize13W600ColorLightPurple() {
    return  TextStyle(
      color:Color(0xFF4E4B66),
      fontSize: 13,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      letterSpacing: 0.12,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle fontSize16W400ColorLightPurple() {
    return const TextStyle(
      color: AppColors.lightPurpleColor,
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle fontSize16W400ColorBlack() {
    return const TextStyle(
      color: AppColors.blackColor,
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle fontSize14W400ColorLightPurple() {
    return const TextStyle(
      color: AppColors.lightPurpleColor,
      fontSize: 14,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle fontSize14W400ColorLightBlue() {
    return const TextStyle(
      color:Color(0xFF5890FF),
      fontSize: 14,
      fontFamily: 'Poppins',
      letterSpacing: .12,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle fontSize14W400ColorExtraLightPurple() {
    return const TextStyle(
      color:Color(0xFFA0A3BD),
      fontSize: 14,
      fontFamily: 'Poppins',
      letterSpacing: .12,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle fontSize13W400ColorExtraLightPurple() {
    return const TextStyle(
      color:Color(0xFF667080),
      fontSize: 13,
      fontFamily: 'Poppins',
      letterSpacing: .12,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    );
  }


  static TextStyle fontSize16W600ColorWhite() {
    return const TextStyle(
      color:AppColors.whiteColor,
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      letterSpacing: 0.12,
      overflow: TextOverflow.ellipsis,


    );
  }
  static TextStyle fontSize16W600ColorLightGrey() {
    return const TextStyle(
      color:Color(0xFFB0B3B8),
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      letterSpacing: 0.12,
      overflow: TextOverflow.ellipsis,


    );
  }
}