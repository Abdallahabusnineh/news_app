import 'package:flutter/material.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        left: 5.w,
        right: 5.w,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 32),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Topic',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 16)),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'See all',
                      style: Theme.of(context).textTheme.labelMedium,
                    ))
              ],
            ),
            Row(
              children: [
                Image.asset(
                  AppAssets.topicImg,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 1.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Health',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'Get energizing workout moves, healthy recipes',
                        style: Theme.of(context).textTheme.labelMedium,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.primaryColor, width: 1),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Save',
                          style: Theme.of(context).textTheme.displayLarge),
                    )),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Image.asset(
                  AppAssets.topicImg,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 1.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Health',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'Get energizing workout moves, healthy recipes',
                        style: Theme.of(context).textTheme.labelMedium,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.primaryColor, width: 1),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Save',
                          style: Theme.of(context).textTheme.displayLarge),
                    )),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Image.asset(
                  AppAssets.topicImg,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 1.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Health',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'Get energizing workout moves, healthy recipes',
                        style: Theme.of(context).textTheme.labelMedium,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.primaryColor, width: 1),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Save',
                          style: Theme.of(context).textTheme.displayLarge),
                    )),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Popular Topic',
                style:
                    Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            PostBuilder(isTrendingPost: true),
            PostBuilder(isTrendingPost: true),
            PostBuilder(isTrendingPost: true),
            PostBuilder(isTrendingPost: true),
          ],
        ),
      ),
    ));
  }
}
