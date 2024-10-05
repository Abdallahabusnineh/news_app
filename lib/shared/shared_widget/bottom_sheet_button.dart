import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../core/theme/app_colors.dart';
import '../core/utils/font_style.dart';

class BottomSheetButton extends StatelessWidget {
   BottomSheetButton({super.key,this.onPressed});
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 1),
          )
      ),
      padding: EdgeInsets.only(
        top: 3.h,
        bottom: 2.h,
        left: 5.w,
        right: 5.w,
      ),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.secondaryColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          )),
        ),
        onPressed: () {
          onPressed!();
        },
        child: Text(
          'Next',
          style: AppFontStyle.fontSize16W600ColorWhite(),
        ),
      ),
    );
  }
}
