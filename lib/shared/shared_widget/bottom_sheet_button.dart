import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../core/utils/font_style.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Theme.of(context).brightness == Brightness.light
              ? Border(
                  top: BorderSide(color: Colors.grey.shade300, width: 1),
                )
              : null),
      padding: EdgeInsets.only(
        top: 4.5.h,
        bottom: 4.5.h,
        left: 5.w,
        right: 5.w,
      ),
      child: ElevatedButton(
        onPressed: () {
          onPressed!();
        },
        child: Text(
          'Next',
          style: AppFontStyle.w600(fontSize: 16),
        ),
      ),
    );
  }
}
