import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class EditProfileScreen extends StatelessWidget {
   EditProfileScreen({super.key});
GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        title:  Text('Edit Profile',style: Theme.of(context).textTheme.bodyMedium,),
        actions: [
          IconButton(
            onPressed: () {
              //here we must post data to api
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Form(

        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 5.w,right: 5.w, top: 1.h),

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
              //username
              Text(
                'Username',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                controller: TextEditingController(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter user name';
                  }
                  return null;
                },
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
                controller: TextEditingController(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12
                ),
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
                'email address',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                controller: TextEditingController(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter email address';
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
                controller: TextEditingController(),
                keyboardType: TextInputType.phone,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12
                ),

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
                'Bio',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                controller: TextEditingController(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter bio';
                  }
                  return null;
                },
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
                controller: TextEditingController(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Website address';
                  }
                  return null;
                },
              ),


            ],
          ),
        ),
      ),
    );
  }
}
