import 'package:flutter/material.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/font_style.dart';
import 'package:news_app/shared/core/utils/regex_validation.dart';
import 'package:news_app/src/select_country/presentation/screen/select_country_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
 GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 3.h, left: 5.w, right: 5.w, bottom: 3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: AppFontStyle.fontSize48W700(),
              ),
              Text(
                'Again!',
                style: AppFontStyle.fontSize48W700ColorBlue(),
              ),
              Text(
                'Welcome back you’ve been missed',
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
                  } else if (isValidEmail(email: value.toString())) {
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
                controller: passwordController,
                obscureText: true,
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
                onChanged: (value) {
                  print('teeeeeeeeest ${value}');
                },
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
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password ?',
                      style: AppFontStyle.fontSize14W400ColorLightBlue(),
                    ),
                  )
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const SelectCountryScreen()));
                        /*if (loginFormKey.currentState!.validate()) {
                          print('Login Successfully');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SelectCountryScreen()));
                          //navigate to home
                        }*/
                      },
                      child: Text(
                        'Login',
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
                    'Don’t have an account ?',
                    style: AppFontStyle.fontSize14W400ColorLightPurple(),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: AppFontStyle.fontSize14W600ColorBlue(),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
