import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/abstraction/cash_helper.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:news_app/shared/core/utils/regex_validation.dart';
import 'package:news_app/shared/core/utils/show_toast.dart';
import 'package:news_app/src/auth/data/repositories/auth_repository.dart';
import 'package:news_app/src/auth/presentation/providers/register/register_state.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier(this.authRepository)
      : super(RegisterState(
    filledColor: false,
      rememberMe: false,
    showConfirmedPassword: true,
    showSuffixIconForUserName: false,
    showPassword: true,
            isInitial: true,
            isLoading: false,
            isSuccess: false,
            isError: false));
  AuthRepository authRepository;
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  bool showPassword = false;
  bool showConfirmedPassword = false;
  bool rememberMe = false;
  bool showSuffixIconForUserName = false;
  bool filledColor = false;

  /*bool ShowPassword = false;*/

  Future<void> register(BuildContext context) async {
    // Set loading state to true
    state = state.copyWith(isLoading: true,isInitial: false);
    try {
      final result = await authRepository.register(
          userNameController.text,
          emailController.text,
          passwordController.text,
          confirmPasswordController.text);
      result.fold(
        (l) {
          print('error abd ${l.message}');
          showToast(text: l.message, state: ToastState.ERROR);
          state = state.copyWith(isLoading: false, isError: true);
        },
        (r) {
          {
            state = state.copyWith(isLoading: false, isSuccess: true,);
            CacheHelper.saveData(key: 'token', value: r.token).then((value) {
              AppConstant.token = r.token;
              appRouter.push(
                const SelectCountryRoute(),
              );
              emailController.clear();
              passwordController.clear();
              confirmPasswordController.clear();
              userNameController.clear();
            });

            showToast(text: 'Sign Up Successfully', state: ToastState.SUCCESS);
            print('register success');

          }
        },
      );
    } catch (e) {
      // Handle error
      state = state.copyWith(
        isLoading: false,
      );
      showToast(text: 'Invalid username or password', state: ToastState.ERROR);

    }
  }

  void toggleShowPassword() async {
    showPassword =!showPassword;
    state = state.copyWith(showPassword: showPassword);

  }
  void toggleShowConfirmedPassword() async {
    showConfirmedPassword =!showConfirmedPassword;
    state = state.copyWith(showConfirmedPassword: showConfirmedPassword);

  }

  void toggleRememberMe() async {
    rememberMe =!rememberMe;
    state = state.copyWith(rememberMe: rememberMe);

  }
  String? toggleShowSuffixIconForUserName(String? value) {
    if (userNameController.text.isEmpty) {
      value='Please enter username';
      showSuffixIconForUserName =true;
      filledColor =true;
      state = state.copyWith(showSuffixIconForUserName: showSuffixIconForUserName,filledColor: filledColor);

    }else if (RegexValidation.userNameValidation(name: userNameController.text)) {
      value = null;
      showSuffixIconForUserName =false;
      filledColor =false;
      state = state.copyWith(filledColor: filledColor,showSuffixIconForUserName: showSuffixIconForUserName);
    }
    else {
      value ='Invalid username';
      showSuffixIconForUserName =true;
      filledColor =true;
      state = state.copyWith(showSuffixIconForUserName: showSuffixIconForUserName,filledColor: filledColor);
    }
    return value;

  }

}
