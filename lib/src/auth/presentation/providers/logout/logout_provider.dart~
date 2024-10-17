import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/abstraction/cash_helper.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/src/auth/data/datasource/auth_data_source.dart';
import 'package:news_app/src/auth/data/repositories/auth_repository.dart';
import 'package:news_app/src/auth/presentation/screen/login/login_screen.dart';
import 'package:news_app/src/onboarding_screen/initial_screen.dart';

final logoutChangeNotifierProvider = ChangeNotifierProvider<LogoutChangeNotifier>((ref) {
  return LogoutChangeNotifier();
});
class LogoutChangeNotifier extends ChangeNotifier{
  LogoutChangeNotifier():super();

  AuthRepository authRepository = AuthRepository(
    baseAuthDataSource: AuthDataSource()
  );

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool isLoading){
    _isLoading = isLoading;
    notifyListeners();
  }
  bool _isError = false;
  bool get isError => _isError;
  set isError(bool isError){
    _isError = isError;
    notifyListeners();
  }
  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;
  set isSuccess(bool isSuccess){
    _isSuccess = isSuccess;
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    isLoading = true;
    try {
      final result = await authRepository.logout();
      result.fold(
            (l) {
         isError= true;
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             backgroundColor: AppColors.errorColor,
             content: Text(
               'Logout Failed',
               style: Theme.of(context).textTheme.bodyMedium,
             ),
           ),
         );
        },
            (r) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                      (route) => false);
          CacheHelper.removeData(key: 'token').then(
                (value) {
          AppConstant.token = '';
          print('logout $value');
          });

          isSuccess = true;
          print('logout $r');
        },
      );
    }
    catch (e) {
      // Handle error
      isError = true;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.errorColor,
          content: Text(
            'Logout Failed',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      );
      print('logout error catch $e');
    }
    isLoading = false;
  }

}