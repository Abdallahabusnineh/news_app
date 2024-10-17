import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/abstraction/cash_helper.dart';
import 'package:news_app/shared/abstraction/dio_helper.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await DioHelper.init();
  await CacheHelper.init();
  //AppConstant.isDark = await CacheHelper.isDark();
  runApp(const ProviderScope(child: MyApp()));
}

