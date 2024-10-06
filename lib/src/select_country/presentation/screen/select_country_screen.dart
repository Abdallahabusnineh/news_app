import 'package:flutter/material.dart';
import 'package:news_app/shared/core/utils/font_style.dart';
import 'package:news_app/src/topics/presentation/screen/topics.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../shared/core/theme/app_colors.dart';
import '../../../../shared/shared_widget/bottom_sheet_button.dart';
import '../../../../shared/shared_widget/search_bar.dart';

class SelectCountryScreen extends StatelessWidget {
  const SelectCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                const CustomSearchBar(
                  isHasLeading: false,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          leading: Icon(Icons.flag),
                          title: Text('Country ${index + 1}'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )),
        bottomSheet: BottomSheetButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChooseYourTopics()));
          },
        ));
  }
}
