import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/abstraction/cash_helper.dart';
import 'package:news_app/shared/abstraction/dio_helper.dart';
import 'app.dart';
import 'package:device_preview/device_preview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await DioHelper.init();
  await CacheHelper.init();
  //AppConstant.isDark = await CacheHelper.isDark();
  /*bool isTokenExpired = JwtDecoder.isExpired(AppConstant.token);
  if (!isTokenExpired) {
    // The user should authenticate
    print('token is not expired');

  }*/
  runApp( DevicePreview(
    enabled: true,
    builder: (context) => const ProviderScope(child: MyApp()), // Wrap your app
  ),);
}
