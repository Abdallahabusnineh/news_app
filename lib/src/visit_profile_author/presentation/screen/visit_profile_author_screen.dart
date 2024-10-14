import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VisitProfileAuthorScreen extends ConsumerWidget {
  const VisitProfileAuthorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 5.w,
          right: 5.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: CircleAvatar(
                    radius: 30.sp,
                    backgroundImage: const AssetImage(
                      AppAssets.trendingCircleAvatar,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Column(
                  children: [
                    Text(
                      '1.2M',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Followers',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                SizedBox(
                  width: 2.w,
                ),
                Column(
                  children: [
                    Text(
                      '124K',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Following',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                SizedBox(
                  width: 2.w,
                ),
                Column(
                  children: [
                    Text(
                      '326',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'News',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'BBC News',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'is an operational business division of the British Broadcasting Corporation responsible for the gathering and broadcasting of news and current affairs.',
              style: Theme.of(context).textTheme.labelLarge,
              maxLines: 3,
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {

                        },
                        child: const Text('Following'))),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Website'))),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Align(
              alignment: Alignment.center,
              child: ToggleButtons(
                  isSelected: const [false, true],
                  onPressed: (int index) {},
                  fillColor: Colors.transparent,
                  renderBorder: false,
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                      child: const Text(
                        'News',
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: AppColors.primaryColor, width: 5),
                        ),
                      ),
                      child: Text(
                        'Recent',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: 2.h,
            ),
            PostBuilder(
              isTrendingPost: false,
            ),
            PostBuilder(
              isTrendingPost: false,
            ),
            PostBuilder(
              isTrendingPost: false,
            ),
            PostBuilder(
              isTrendingPost: false,
            ),
            PostBuilder(
              isTrendingPost: false,
            ),
          ],
        ),
      ),
    );
  }
}
