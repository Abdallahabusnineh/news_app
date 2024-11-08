import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:news_app/shared/core/utils/show_toast.dart';
import 'package:news_app/shared/shared_widget/bottom_sheet_button.dart';
import 'package:news_app/src/fill_profile/presentation/providers/fill_profile_notifer.dart';
import 'package:news_app/src/topics/presentation/providers/topics_notifer_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

@RoutePage()
class FillProfile extends ConsumerWidget {
  const FillProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notifier = ref.watch(createProfileNotifierProvider);
    print('build home screen ${TopicsNotifier.selectedTopics}');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            appRouter.popForced();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Fill your Profile',
        ),
      ),
      body: Form(
        key: notifier.formKey,
        child: Stack(
          children: [
            Container(
                padding: EdgeInsets.only(
                    left: 5.w, right: 5.w, top: 1.h, bottom: 15.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            notifier.isFilePicked
                                ? CircleAvatar(
                                    radius: 35.sp,
                                    backgroundImage:
                                        Image.file(notifier.attachmentFile!)
                                            .image)
                                : CircleAvatar(
                                    radius: 35.sp,
                                    backgroundColor: const Color(0xFFEEF1F4),
                                  ),
                            Positioned(
                                right: 1,
                                bottom: 1,
                                child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: const BoxDecoration(
                                        color: AppColors.primaryColor,
                                        shape: BoxShape.circle),
                                    child: GestureDetector(
                                      onTap: () {
                                        notifier.pickFile();
                                      },
                                      child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          child: Image.asset(
                                            AppAssets.camera,
                                          )),
                                    )))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'Full Name',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormField(
                        controller: notifier.fullNameController,
                        keyboardType: TextInputType.text,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 12),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter full name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'Phone Number',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormField(
                        controller: notifier.phoneNumberController,
                        keyboardType: TextInputType.phone,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 12),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter phone number ';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomSheetButton(
                onPressed: () async {
                  if (notifier.formKey.currentState!.validate()) {
                    if (notifier.attachmentFile == null) {
                      showToast(
                        text: 'Please select profile photo',
                        state: ToastState.WARNING,
                      );
                    } else {
                      await notifier.createProfile();
                      notifier.isSuccess
                          ? appRouter.pushAndPopUntil(
                              const MainRoute(),
                              predicate: (route) => false,
                            )
                          : showToast(
                              text: 'Something went wrong',
                              state: ToastState.ERROR);
                    }
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
