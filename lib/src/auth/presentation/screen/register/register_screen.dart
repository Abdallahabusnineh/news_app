import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:news_app/shared/core/utils/regex_validation.dart';
import 'package:news_app/src/auth/domain/providers/auth_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

@RoutePage()
class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerNotifier = ref.read(registerNotifierProvider.notifier);
    final registerState = ref.watch(registerNotifierProvider);
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.only(top: 6.h, left: 5.w, right: 5.w, bottom: 3.h),
      child: Form(
        key: registerNotifier.registerFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello!',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: AppColors.primaryColor),
            ),
            Text(
              'sign up to get started',
              style: Theme.of(context).textTheme.headlineMedium,
              maxLines: 2,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text('Email', style: Theme.of(context).textTheme.labelMedium),
            SizedBox(
              height: 1.h,
            ),
            TextFormField(
              controller: registerNotifier.emailController,
              keyboardType: TextInputType.emailAddress,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 12),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter email ';
                } else if (RegexValidation.isValidEmail(
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
            Text('Username', style: Theme.of(context).textTheme.labelMedium),
            SizedBox(
              height: 1.h,
            ),
            TextFormField(
                controller: registerNotifier.userNameController,
                keyboardType: TextInputType.text,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 12),
                decoration: InputDecoration(
                  fillColor: registerNotifier.filledColor
                      ? Colors.red.withOpacity(0.1):Colors.transparent,
                  filled: registerNotifier.filledColor,
                  suffixIcon: registerNotifier.showSuffixIconForUserName
                      ? const Icon(
                          Icons.close,
                          color: AppColors.errorColor,
                        )
                      : null,
                ),
                validator: (value) {
                  return registerNotifier
                      .toggleShowSuffixIconForUserName(value);
                }),
            SizedBox(
              height: 1.h,
            ),
            Text('Password', style: Theme.of(context).textTheme.labelMedium),
            SizedBox(
              height: 1.h,
            ),
            TextFormField(
              obscureText: registerNotifier.showPassword,
              controller: registerNotifier.passwordController,
              keyboardType: TextInputType.visiblePassword,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 12),
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
                          ? Icons.visibility_off_outlined
                          : Icons.visibility))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter password';
                } else if (RegexValidation.validatePasswordRegex(
                    password: value)) {
                  return null;
                } else {
                  return 'Password must be at least 6 characters';
                }
              },
            ),
            SizedBox(
              height: 1.h,
            ),
            Text('Confirm Password',
                style: Theme.of(context).textTheme.labelMedium),
            SizedBox(
              height: 1.h,
            ),
            TextFormField(
              obscureText: registerNotifier.showConfirmedPassword,
              controller: registerNotifier.confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 12),
              decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: const BorderSide(color: Colors.red, width: 1),
                  ),
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
                          ? Icons.visibility_off_outlined
                          : Icons.visibility))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter password';
                } else if (registerNotifier.confirmPasswordController.text !=
                    registerNotifier.passwordController.text) {
                  return 'Password does not match';
                }
                return null;
              },
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: AppColors.primaryColor,
                  value: registerNotifier.rememberMe,
                  onChanged: (value) {
                    registerNotifier.toggleRememberMe();
                  },
                ),
                Text(
                  'Remember me',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            registerState.isLoading
                ? const SpinKitSquareCircle(
                    color: AppColors.primaryColor,
                  )
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (registerNotifier.registerFormKey.currentState!
                              .validate()) {
                            registerNotifier.register(context);
                          }
                        },
                        child: const Text(
                          'Sign Up',
                        ))),
            SizedBox(
              height: 2.h,
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
                    padding: WidgetStateProperty.all(const EdgeInsets.only(
                      bottom: 12,
                      top: 12,
                      left: 16,
                      right: 24,
                    )),
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
                      Text('Facebook',
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                )),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                    child: TextButton(
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(const EdgeInsets.only(
                      bottom: 12,
                      top: 12,
                      left: 16,
                      right: 24,
                    )),
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
                      Text('Google',
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account ?',
                    style: Theme.of(context).textTheme.labelMedium),
                TextButton(
                  onPressed: () {
                   appRouter.replace(const LoginRoute());
                  },
                  child: Text('Login',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600)),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
