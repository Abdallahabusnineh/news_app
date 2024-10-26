import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/abstraction/cash_helper.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/shared/core/utils/show_toast.dart';
import 'package:news_app/src/auth/data/repositories/auth_repository.dart';
import 'package:news_app/src/auth/presentation/providers/register/register_state.dart';
import 'package:news_app/src/select_country/presentation/screen/select_country_screen.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier(this.authRepository)
      : super(RegisterState(
      rememberMe: false,
    showConfirmedPassword: true,
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
  bool showPassword = true;
  bool showConfirmedPassword = true;
  bool rememberMe = false;

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
          showToast(text: 'Invalid username or password', state: ToastState.ERROR);
          state = state.copyWith(isLoading: false, isError: true);
        },
        (r) {
          {
            CacheHelper.saveData(key: 'token', value: r.token).then((value) {
              AppConstant.token = r.token;
            });
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>   SelectCountryScreen()));
            showToast(text: 'Sign Up Successfully', state: ToastState.SUCCESS);
            print('register success');
            state = state.copyWith(isLoading: false, isSuccess: true,);

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
}
