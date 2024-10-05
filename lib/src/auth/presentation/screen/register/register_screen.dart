import 'package:flutter/material.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../shared/core/theme/app_colors.dart';
import '../../../../../shared/core/utils/font_style.dart';
import '../../../../../shared/core/utils/regex_validation.dart';
import '../../../../select_country/presentation/screen/select_country_screen.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: registerFormKey,
      child: Container(
        padding: EdgeInsets.only(top: 3.h, left: 5.w, right: 5.w, bottom: 3.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello!',
                style: AppFontStyle.fontSize48W700ColorBlue(),
              ),
              Text(
                'sign up to get started',
                style: AppFontStyle.fontSize20W400ColorLightPurple(),
                maxLines: 2,
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Email',
                style: AppFontStyle.fontSize16W400ColorBlack(),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFF4E4B66), width: 1),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter email ';
                  } else if (isValidEmail(
                      email: value.toString())) {
                    return null;
                  } else {
                    return 'Please enter valid email';
                  }
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Password',
                style: AppFontStyle.fontSize16W400ColorBlack(),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFF4E4B66), width: 1),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  suffixIcon: const Icon(
                    Icons.visibility_off_outlined,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  } else if (validatePasswordRegex(password: value)) {
                    return null;
                  } else {
                    return 'Password must be at least 8 characters';
                  }
                },
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.whiteColor,
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text(
                    'Remember me',
                    style: AppFontStyle.fontSize14W400ColorLightPurple(),
                  ),
                ],
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.secondaryColor),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)))),
                      onPressed: () {
                        if (registerFormKey.currentState!.validate()) {
                          print('Login Successfully');
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>   const SelectCountryScreen()));
                          //navigate to home
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: AppFontStyle.fontSize16W600ColorWhite(),
                      ))),
              SizedBox(
                height: 1.h,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    'or continue with',
                    style: AppFontStyle.fontSize14W400ColorLightPurple(),
                  )),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFEEF1F4)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.imagesIconFacebook),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          'Google',
                          style: AppFontStyle.fontSize14W400ColorLightPurple(),
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                      child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFEEF1F4)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.imagesIconGoogle),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          'Google',
                          style: AppFontStyle.fontSize14W400ColorLightPurple(),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account ?',
                    style: AppFontStyle.fontSize14W400ColorLightPurple(),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>  LoginScreen()));
                    },
                    child: Text(
                      'Login',
                      style: AppFontStyle.fontSize14W600ColorBlue(),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
