import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/abstraction/cash_helper.dart';
import 'package:news_app/shared/abstraction/dio_helper.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  CashHelper.init();
  runApp(const ProviderScope(child: MyApp()));
}

