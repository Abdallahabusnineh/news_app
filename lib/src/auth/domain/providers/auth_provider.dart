import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/auth/data/datasource/auth_data_source.dart';
import 'package:news_app/src/auth/data/repositories/auth_repository.dart';
import 'package:news_app/src/auth/presentation/providers/login/login_notifier.dart';
import 'package:news_app/src/auth/presentation/providers/register/register_notifier.dart';

import '../../presentation/providers/login/login_state.dart';
import '../../presentation/providers/register/register_state.dart';

final dataSourceProvider = Provider<BaseAuthDataSource>((ref) {
  return AuthDataSource();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(baseAuthDataSource: ref.watch(dataSourceProvider));
});

final loginNotifierProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref.watch(authRepositoryProvider));
});

final registerNotifierProvider = StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
  return RegisterNotifier(ref.watch(authRepositoryProvider));
});
