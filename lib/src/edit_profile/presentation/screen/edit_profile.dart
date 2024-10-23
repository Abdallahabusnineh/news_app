import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/show_toast.dart';
import 'package:news_app/src/edit_profile/presentation/providers/edit_profile_provider.dart';
import 'package:news_app/src/main_screen/presentaion/screen/main_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notifier = ref.watch(editProfileNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {
              //here we must post data to api
              if (notifier.formKey.currentState!.validate()) {
                notifier.editProfile();
                if (notifier.isSuccess) {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return const MainScreen();
                  }), (route) => false);
                }
              }
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: notifier.isLoading
          ? const Center(
              child: SpinKitFadingCircle(
              color: AppColors.primaryColor,
            ))
          : Form(
              key: notifier.formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 1.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          CircleAvatar(
                              radius: 35.sp,
                              backgroundImage: notifier.isFilePicked
                                  ? Image.file(notifier.attachmentFile!).image
                                  : AssetImage(AppAssets.user)),
                          Positioned(
                              right: 1,
                              bottom: 1,
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                      color: AppColors.primaryColor,
                                      shape: BoxShape.circle),
                                  child: GestureDetector(
                                    onTap: () async {
                                      notifier.pickFile();
                                    },
                                    child: CircleAvatar(
                                        radius: 50,
                                        backgroundColor: AppColors.primaryColor,
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

                    //full Name
                    Text(
                      'Full Name',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextFormField(
                      controller: notifier.fullNameController,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 12),
                      keyboardType: TextInputType.text,
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

                    //email address
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
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Country Id',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextFormField(
                      controller: notifier.countryIdController,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 12),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter country id';
                        }
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Bio',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextFormField(
                      controller: notifier.bioController,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 12),
                      keyboardType: TextInputType.text,
                      /* validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter bio';
                  }
                  return null;
                },*/
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Website',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextFormField(
                      controller: notifier.websiteController,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 12),
                      keyboardType: TextInputType.text,
                      /*  validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Website address';
                  }
                  return null;
                },*/
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
