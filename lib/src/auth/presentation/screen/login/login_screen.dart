import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/regex_validation.dart';
import 'package:news_app/src/auth/domain/providers/auth_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../register/register_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});


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
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'Again!',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.primaryColor
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Welcome back you’ve been missed',
                  style: Theme.of(context).textTheme.headlineMedium,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'Username',
                  style: Theme.of(context).textTheme.labelMedium
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextFormField(
                  controller: loginNotifier.usernameController,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter username ';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Password',
                  style: Theme.of(context).textTheme.labelMedium
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextFormField(
                  controller: loginNotifier.passwordController,
                  obscureText: loginNotifier.showPassword,
                  keyboardType: TextInputType.visiblePassword,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12
                  ),
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
                      style: Theme.of(context).textTheme.labelMedium
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password ?',
                        style: Theme.of(context).textTheme.displayMedium
                      ),
                    )
                  ],
                ),
                loginState.isLoading ? const SpinKitSquareCircle(
                  color: AppColors.primaryColor,
                ) : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(

                        onPressed: (){
                          if (loginNotifier.loginFormKey.currentState!.validate()) {
                            loginNotifier.login(context);
                            //navigate to home
                          }

                        },
                        child: const Text(
                          'Login',
                        ))),
                SizedBox(
                  height: 1.h,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      'or continue with',
                      style: Theme.of(context).textTheme.labelMedium,
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
                            WidgetStateProperty.all(const Color(0xFFEEF1F4)),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
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
                            'facebook',
                              style: Theme.of(context).textTheme.labelMedium
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
                            WidgetStateProperty.all(const Color(0xFFEEF1F4)),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
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
                            style: Theme.of(context).textTheme.labelMedium
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
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600

                        )
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
