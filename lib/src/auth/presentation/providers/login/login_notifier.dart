import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/abstraction/cash_helper.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:news_app/shared/core/utils/regex_validation.dart';
import 'package:news_app/shared/core/utils/show_toast.dart';
import 'package:news_app/src/auth/data/repositories/auth_repository.dart';

import 'login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(this.authRepository)
      : super(LoginState(
            rememberMe: false,
            filledColor: false,
            showPassword: true,
            isInitial: true,
            isLoading: false,
            showSuffixIconForUserName: false,
            isSuccess: false,
            isError: false));
  AuthRepository authRepository;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool showPassword = true;
  bool rememberMe = false;
  bool showSuffixIconForUserName = false;
  bool filledColor = false;

  Future<void> login() async {
    // Set loading state to true
    state = state.copyWith(isLoading: true, isInitial: false);
    try {
      final result = await authRepository.login(
          usernameController.text.trim(), passwordController.text.trim());
      result.fold(
        (l) {
          state = state.copyWith(isLoading: false, isError: true);
          showToast(
              text: 'Invalid username or password', state: ToastState.ERROR);
        },
        (r) {
          state = state.copyWith(isLoading: false, isSuccess: true);
          //  appRouter.replace(const MainScreenRoute());
          CacheHelper.saveData(key: 'token', value: r.token).then((value) {
            AppConstant.token = r.token;
            AppConstant.isAuth = true;
            CacheHelper.saveData(key: 'isAuth', value: true);
            appRouter.pushAndPopUntil(
              const MainRoute(),
            predicate: (route) => false,
            );
            usernameController.clear();
            passwordController.clear();
          });

          showToast(text: 'Login Success', state: ToastState.SUCCESS);
        },
      );
    } catch (e) {
      // Handle error
      state = state.copyWith(
        isLoading: false,
        isError: true,
      );
      showToast(text: 'Invalid username or password', state: ToastState.ERROR);
    }
  }

  String? toggleShowSuffixIconForUserName(String? value) {
    if (usernameController.text.isEmpty) {
      value = 'Please enter username';
      showSuffixIconForUserName = true;
      filledColor = true;
      state = state.copyWith(
          showSuffixIconForUserName: showSuffixIconForUserName,
          filledColor: filledColor);
    } else if (RegexValidation.userNameValidation(
        name: usernameController.text)) {
      value = null;
      showSuffixIconForUserName = false;
      filledColor = false;
      state = state.copyWith(
          showSuffixIconForUserName: showSuffixIconForUserName,
          filledColor: filledColor);
    } else {
      value = 'Invalid username';
      showSuffixIconForUserName = true;
      filledColor = true;
      state = state.copyWith(
          showSuffixIconForUserName: showSuffixIconForUserName,
          filledColor: filledColor);
    }
    return value;
  }

  void toggleShowPassword() async {
    showPassword = !showPassword;
    state = state.copyWith(showPassword: showPassword);
  }

  void toggleRememberMe() async {
    rememberMe = !rememberMe;
    state = state.copyWith(rememberMe: rememberMe);
  }
}
