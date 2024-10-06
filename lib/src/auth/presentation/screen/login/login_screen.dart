import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/font_style.dart';
import 'package:news_app/shared/core/utils/regex_validation.dart';
import 'package:news_app/shared/core/utils/show_toast.dart';
import 'package:news_app/src/auth/domain/providers/auth_provider.dart';
import 'package:news_app/src/select_country/presentation/screen/select_country_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../register/register_screen.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.read(loginNotifierProvider.notifier);
    final loginState = ref.watch(loginNotifierProvider);
    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 3.h, left: 5.w, right: 5.w, bottom: 3.h),
          child: Form(
            key: loginNotifier.loginFormKey,
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
                  'Username',
                  style: AppFontStyle.fontSize16W400ColorBlack(),
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextFormField(
                  controller: loginNotifier.usernameController,
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
                      return 'Please enter username ';
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
                  controller: loginNotifier.passwordController,
                  obscureText: loginNotifier.showPassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xFF4E4B66), width: 1),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    suffixIcon: IconButton(onPressed: () {
                      loginNotifier.toggleShowPassword();
                    }, icon: Icon(loginNotifier.showPassword ? Icons.visibility : Icons.visibility_off)),
                  ),
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
                Row(
                  children: [
                    Checkbox(
                      activeColor: AppColors.primaryColor,
                      checkColor: AppColors.whiteColor,
                      value: loginNotifier.rememberMe,
                      onChanged: (value) {
                        loginNotifier.toggleRememberMe();

                      },
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
                loginState.isLoading ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ) : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)))),
                        onPressed: (){
                          if (loginNotifier.loginFormKey.currentState!.validate()) {
                            loginNotifier.login();
                        if(loginState.isSuccess)
                              {
                                showToast(text: 'Login Successfully', state: ToastState.SUCCESS);
                             Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const SelectCountryScreen()));
                              }
                           else  if(loginState.isError)
                              {
                                showToast(text: 'Login Failed', state: ToastState.ERROR);
                              }
                            print('state is ${loginState.isSuccess}');
                            //navigate to home
                          }
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
                        Navigator.pushReplacement(
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
          ),
        ));
  }
}
