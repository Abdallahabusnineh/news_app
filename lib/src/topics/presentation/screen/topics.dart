import 'package:flutter/material.dart';
import 'package:news_app/shared/shared_widget/search_bar.dart';
import 'package:news_app/src/fill_profile/presentation/screen/fill_profile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../shared/core/theme/app_colors.dart';
import '../../../../shared/core/utils/font_style.dart';
import '../../../../shared/shared_widget/bottom_sheet_button.dart';



class ChooseYourTopics extends StatelessWidget {
  const ChooseYourTopics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
        AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          centerTitle: true,
          title: Text(
            'Select your country',
            style: AppFontStyle.fontSize16W600ColorBlack(),
          ),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            child: Column(
              children: [

                const CustomSearchBar(isHasLeading: false,),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 2.w,
                    runSpacing: 1.h,
                    crossAxisAlignment:WrapCrossAlignment.start,
                    children: [
                     Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(6),
                         border: Border.all(color: AppColors.primaryColor, width: 1),
                       ),
                       child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                         child: Text('Science', style: AppFontStyle.fontSize16W600ColorBlue()),
                       ),
                     ),
                     Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(6),
                         border: Border.all(color: AppColors.primaryColor, width: 1),
                       ),
                       child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                         child: Text('Science', style: AppFontStyle.fontSize16W600ColorBlue()),
                       ),
                     ),
                     Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(6),
                         border: Border.all(color: AppColors.primaryColor, width: 1),
                       ),
                       child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                         child: Text('Science', style: AppFontStyle.fontSize16W600ColorBlue()),
                       ),
                     ),
                     Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(6),
                         border: Border.all(color: AppColors.primaryColor, width: 1),
                       ),
                       child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                         child: Text('Science', style: AppFontStyle.fontSize16W600ColorBlue()),
                       ),
                     ),
                     Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(6),
                         border: Border.all(color: AppColors.primaryColor, width: 1),
                       ),
                       child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                         child: Text('Science', style: AppFontStyle.fontSize16W600ColorBlue()),
                       ),
                     ),
                     Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(6),
                         border: Border.all(color: AppColors.primaryColor, width: 1),
                       ),
                       child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                         child: Text('Science', style: AppFontStyle.fontSize16W600ColorBlue()),
                       ),
                     ),
                     Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(6),
                         border: Border.all(color: AppColors.primaryColor, width: 1),
                       ),
                       child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                         child: Text('Science', style: AppFontStyle.fontSize16W600ColorBlue()),
                       ),
                     ),
                    ],
                  ),
                ),
              ],
            )),
        bottomSheet:  BottomSheetButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FillProfile()));
          },
        ));
  }
}
