import 'package:flutter/material.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/src/comment_screen/presentation/widget/comment_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comments',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 5.w,
            right: 5.w,
            bottom: 15.h,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const CommentWidget(
                  name: 'Wilson Franci',
                  comment:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  date: '4w',
                  likeNum: '125',
                  image: AppAssets.notificationImg);
            },
          )),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12
                ),
                decoration: InputDecoration(
                    hintText: 'Type your comment',
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    )),
              ),
            ),
            SizedBox(width: 2.w,),
            IconButton(
                style: ButtonStyle(

                  padding: WidgetStatePropertyAll(EdgeInsets.all(20.sp)),
                  foregroundColor: const WidgetStatePropertyAll(Colors.white),
                  backgroundColor:
                      const WidgetStatePropertyAll(AppColors.primaryColor),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  )),
                ),
                onPressed: () {},
                icon: const Icon(Icons.send))
          ],
        ),
      ),
    );
  }
}
