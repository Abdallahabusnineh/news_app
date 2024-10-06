import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/auth/data/repositories/auth_repository.dart';
import 'package:news_app/src/auth/presentation/providers/register/register_state.dart';

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

  Future<void> register() async {
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
          state = state.copyWith(isLoading: false, isError: true);
        },
        (r) {
          {
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
