import 'package:flutter/material.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/shared_widget/search_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../shared/core/theme/app_colors.dart';
import '../../../../shared/core/utils/font_style.dart';
import '../../../../shared/shared_widget/bottom_sheet_button.dart';

class NewSources extends StatelessWidget {
  const NewSources({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar:  AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          centerTitle: true,
          title: Text(
            'Choose Your New Sources',
            style: AppFontStyle.fontSize16W600ColorBlack(),
          ),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            child: Column(
              children: <Widget>[

              const CustomSearchBar(isHasLeading: false,),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 15,

                      gridDelegate:
                           SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                             crossAxisSpacing: 15,
                    mainAxisSpacing: 2.0.h,
                  ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: .5.w, vertical: 1.h),
                         decoration: BoxDecoration(
                         color: Colors.grey.shade50,
                           borderRadius: BorderRadius.circular(6),
                       ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.all(1.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                                      color: const Color(0xFFEEF1F4)
                                  ),
                                  child: Image.asset(AppAssets.vector)),
                            ),
                            SizedBox(
                              height: .5.h,
                            ),
                            Text('CNBC',style: AppFontStyle.fontSize16W600ColorBlack(),),
                            Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 1.w,
                                  vertical: 0.5.h,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                    width: 1.5
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text('Follow',style: AppFontStyle.fontSize16W600ColorBlue(),),),
                          ],
                        ),
                      );
                    },
                  
                  ),
                )
              ],
            )),
        bottomSheet:  BottomSheetButton());
  }
}
