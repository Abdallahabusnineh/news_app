import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder.dart';
import 'package:news_app/src/create_news/presentation/screen/create_news_screen.dart';
import 'package:news_app/src/edit_profile/presentation/screen/edit_profile.dart';
import 'package:news_app/src/setting/presentation/screen/setting_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateNewsPost(),));
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(
          Icons.add,
          color: AppColors.whiteColor,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen(),));
            },
            icon: Image.asset(AppAssets.iconSettings,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : AppColors.whiteColor,
              height: 5.h,
              width: 5.h,
            ),
          ),
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
                      AppAssets.notificationImg,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Column(
                  children: [
                    Text(
                      '2156',
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
                      '567',
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
                      '23',
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
              'Wilson Franci',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditProfileScreen(),));
                        }, child: const Text('Edit Profile'))),
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
                          bottom: BorderSide(color: AppColors.primaryColor,width: 5),
                        ),
                      ),
                      child: Text(
                        'Recent',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  ]),
            ),
            SizedBox(height: 2.h,),
            PostBuilder(isTrendingPost: false,),
            PostBuilder(isTrendingPost: false,),
            PostBuilder(isTrendingPost: false,),
            PostBuilder(isTrendingPost: false,),
            PostBuilder(isTrendingPost: false,),
          ],
        ),
      ),
    );
  }
}
