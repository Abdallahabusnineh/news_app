import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/abstraction/cash_helper.dart';

import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:news_app/shared/core/utils/show_toast.dart';
import 'package:news_app/src/auth/domain/providers/auth_provider.dart';
import 'package:news_app/src/main_screen/presentaion/providers/navigation_bar_providers.dart';

final logoutChangeNotifierProvider =
    ChangeNotifierProvider<LogoutChangeNotifier>((ref) {
  return LogoutChangeNotifier(ref);
});

class LogoutChangeNotifier extends ChangeNotifier {
  LogoutChangeNotifier(this.ref);
  late ChangeNotifierProviderRef ref;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool _isError = false;
  bool get isError => _isError;
  set isError(bool isError) {
    _isError = isError;
    notifyListeners();
  }

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;
  set isSuccess(bool isSuccess) {
    _isSuccess = isSuccess;
    notifyListeners();
  }

  Future<void> logout() async {
    isLoading = true;
    try {
      final result = await ref.read(authRepositoryProvider).logout();
      result.fold(
        (l) {
          isError = true;
        showToast(text: 'Logout Failed', state: ToastState.ERROR);
        },
        (r) {
        appRouter.pushAndPopUntil(
            predicate: (route) => false,
            const LoginRoute());
          CacheHelper.removeData(key: 'token').then((value) {
            AppConstant.token = '';
            print('logout $value');
            ref.read(indexBottomNavbarProvider.notifier).update((state) => 0); // here is i put the index of bottom navbar = 0;

          });
          isSuccess = true;
          print('logout $r');
        },
      );
    } catch (e) {
      // Handle error
      isError = true;
      showToast(text: 'Logout Failed', state: ToastState.ERROR);
      print('logout error catch $e');
    }
    isLoading = false;
  }
}
