import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/abstraction/cash_helper.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/shared/core/utils/show_toast.dart';
import 'package:news_app/src/auth/data/repositories/auth_repository.dart';
import 'package:news_app/src/main_screen/presentaion/screen/main_screen.dart';
import 'package:news_app/src/select_country/presentation/screen/select_country_screen.dart';

import 'login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(this.authRepository)
      : super(LoginState(
    rememberMe: false,
    showPassword: true,
      isInitial: true,
      isLoading: false,
      isSuccess: false,
      isError: false));
  AuthRepository authRepository;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool showPassword = true;
  bool rememberMe = false;

  Future<void> login(BuildContext context) async {
    // Set loading state to true
    state = state.copyWith(isLoading: true,isInitial: false);
    try {
      final result = await authRepository.login(
          usernameController.text.trim(), passwordController.text.trim());
      result.fold(
            (l) {
          state = state.copyWith(isLoading: false, isError: true);
          showToast(text: 'Invalid username or password', state: ToastState.ERROR);
        },
            (r) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const MainScreen()));
              CacheHelper.saveData(key: 'token', value: r.token).then((value) {
                AppConstant.token = r.token;
              });
              state = state.copyWith(isLoading: false, isSuccess: true);
              showToast(text: 'Login Success', state: ToastState.SUCCESS);


            },
      );
    }
    catch (e) {
      // Handle error
      state = state.copyWith(
        isLoading: false,
        isError:  true,
      );
      showToast(text: 'Invalid username or password', state: ToastState.ERROR);

    }
  }

  void toggleShowPassword() async {
    showPassword =!showPassword;
    state = state.copyWith(showPassword: showPassword);

  }
  void toggleRememberMe() async {
    rememberMe =!rememberMe;
    state = state.copyWith(rememberMe: rememberMe);

  }
}
