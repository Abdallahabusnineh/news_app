import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/app.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/src/auth/presentation/screen/login/login_screen.dart';
import 'package:news_app/src/main_screen/presentaion/screen/main_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../shared/core/utils/app_assets.dart';
import '../../../../shared/core/utils/font_style.dart';
import '../../../../shared/core/utils/regex_validation.dart';
import '../../../../shared/shared_widget/bottom_sheet_button.dart';
import '../../../home/presentation/screen/home_screen.dart';

class FillProfile extends StatelessWidget {
  FillProfile({super.key});

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          centerTitle: true,
          title: Text(
            'Fill your Profile',
            style: AppFontStyle.fontSize16W600ColorBlack(),
          ),
        ),
        body: Form(
          key: formKey,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          CircleAvatar(
                              radius: 35.sp,
                              backgroundImage: AssetImage(AppAssets.user)),
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
                                      final ImagePicker picker = ImagePicker();
                                      // Pick an image
                                      final XFile? image =
                                          await picker.pickImage(
                                              source: ImageSource.camera);
                                      AppAssets.user = image!.path;

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
                    Text(
                      'Username',
                      style: AppFontStyle.fontSize14W400ColorLightPurple(),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextFormField(
                      controller: userNameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFF4E4B66), width: 1),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter username';
                        }
                      },
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Full Name',
                      style: AppFontStyle.fontSize14W400ColorLightPurple(),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextFormField(
                      controller: fullNameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFF4E4B66), width: 1),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter full name';
                        }
                      },
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Email Address',
                      style: AppFontStyle.fontSize14W400ColorLightPurple(),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFF4E4B66), width: 1),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter email ';
                        }
                      },
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Phone Number',
                      style: AppFontStyle.fontSize14W400ColorLightPurple(),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFF4E4B66), width: 1),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter phone number ';
                        }
                      },
                    ),
                  ],
                ),
              )),
        ),
        bottomSheet: BottomSheetButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              print('Validated');
            }
           Navigator.push(context,MaterialPageRoute(builder: (context) {
             return const MainScreen();
           },));
          },
        ));
  }
}
