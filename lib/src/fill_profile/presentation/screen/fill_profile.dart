import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/src/main_screen/presentaion/screen/main_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../shared/core/utils/app_assets.dart';
import '../../../../shared/shared_widget/bottom_sheet_button.dart';

class FillProfile extends StatefulWidget {
  const FillProfile({super.key});

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
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
          title: const Text(
            'Fill your Profile',

          ),
        ),
        body: Form(
          key: formKey,
          child: Stack(
            children: [
                  Container(
                  padding: EdgeInsets.only(left: 5.w,right: 5.w, top: 1.h,bottom: 15.h),
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
                                                  source: ImageSource.gallery);
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
                          controller: fullNameController,
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
                        Text(
                          'Phone Number',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          controller: phoneNumberController,
                          keyboardType: TextInputType.phone,
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print('Validated');
                    }
                    Navigator.push(context,MaterialPageRoute(builder: (context) {
                      return const MainScreen();
                    },));
                  },
                ),
              )
                ],
          ),
        ),
        );
  }
}
