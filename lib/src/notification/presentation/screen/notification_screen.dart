import 'package:flutter/material.dart';
import 'package:news_app/shared/core/utils/font_style.dart';
import 'package:news_app/src/notification/presentation/screen/widget/notification_builder.dart';
import 'package:news_app/src/notification/presentation/screen/widget/notification_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification',
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today, April 22',
              style: AppFontStyle.w600(fontSize: 16),
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: allNotification.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      NotificationBuilder(
                        index: index,
                      ),
                      SizedBox(
                        height: 3.h,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
