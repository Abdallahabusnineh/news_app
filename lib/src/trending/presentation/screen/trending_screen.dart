import 'package:flutter/material.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../shared/core/utils/font_style.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text(
          'Trending',
          style: AppFontStyle.fontSize16W600ColorBlack(),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: Center(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          itemCount: 10,
          itemBuilder: (context, index) {
          return Column(
            children: [
              PostBuilder(isTrendingPost: true),
              SizedBox(
                height: 3.h,
              )
            ],
          );
        },)
      ),
    );
  }
}
