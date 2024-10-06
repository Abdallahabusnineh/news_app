import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/src/auth/data/model/user_model.dart';
import 'package:news_app/src/auth/domain/entites/user_entites.dart';
import 'package:news_app/src/auth/domain/providers/auth_provider.dart';
import 'package:news_app/src/main_screen/presentaion/screen/main_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../shared/core/theme/app_colors.dart';
import '../../../../../shared/core/utils/font_style.dart';
import '../../../../../shared/core/utils/regex_validation.dart';
import '../../../../select_country/presentation/screen/select_country_screen.dart';
import '../login/login_screen.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerNotifier = ref.read(registerNotifierProvider.notifier);
    final registerState = ref.watch(registerNotifierProvider);
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w, bottom: 3.h),
      child: Form(
        key: registerNotifier.registerFormKey,
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
              controller: registerNotifier.emailController,
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
              'Username',
              style: AppFontStyle.fontSize16W400ColorBlack(),
            ),
            SizedBox(
              height: 1.h,
            ),
            TextFormField(
              controller: registerNotifier.userNameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFF4E4B66), width: 1),
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
              'Password',
              style: AppFontStyle.fontSize16W400ColorBlack(),
            ),
            SizedBox(
              height: 1.h,
            ),
            TextFormField(
              obscureText: registerNotifier.showPassword,
              controller: registerNotifier.passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFF4E4B66), width: 1),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        registerNotifier.toggleShowPassword();
                      },
                      icon: Icon(registerNotifier.showPassword
                          ? Icons.visibility
                          : Icons.visibility_off))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter password';
                } else if (validatePasswordRegex(password: value)) {
                  return null;
                } else {
                  return 'Password must be at least 6 characters';
                }
              },
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              'Confirm Password',
              style: AppFontStyle.fontSize16W400ColorBlack(),
            ),
            SizedBox(
              height: 1.h,
            ),
            TextFormField(
              obscureText: registerNotifier.showConfirmedPassword,
              controller: registerNotifier.confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFF4E4B66), width: 1),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        registerNotifier.toggleShowConfirmedPassword();
                      },
                      icon: Icon(registerNotifier.showConfirmedPassword
                          ? Icons.visibility
                          : Icons.visibility_off))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter password';
                } else if (registerNotifier.confirmPasswordController.text !=
                    registerNotifier.passwordController.text) {
                  return 'Password does not match';
                }
              },
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: AppColors.primaryColor,
                  checkColor: AppColors.whiteColor,
                  value: registerNotifier.rememberMe,
                  onChanged: (value) {
                    registerNotifier.toggleRememberMe();
                  },
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
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)))),
                    onPressed: () {
                      if (registerNotifier.registerFormKey.currentState!
                          .validate()) {
                        registerNotifier.register();
                        registerState.isSuccess
                            ? Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SelectCountryScreen()))
                            : const CircularProgressIndicator();
                        print('state success is ${registerState.isSuccess}');
                        print('state initial is ${registerState.isInitial}');
                        print('state loading is ${registerState.isLoading}');
                        print('state error is ${registerState.isError}');
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
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
    ));
  }
}
