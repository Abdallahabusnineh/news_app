import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/abstraction/cash_helper.dart';
import 'package:news_app/shared/abstraction/dio_helper.dart';
import 'app.dart';
import 'package:device_preview/device_preview.dart';

import 'shared/core/error/custom_error.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  /*ErrorWidget.builder = (FlutterErrorDetails details) {
    return CustomErrorPage(
      errorDetails: details,
    );
  };*/
/*FlutterError.demangleStackTrace = (StackTrace stack) => stack;
FlutterError.onError = (FlutterErrorDetails details)  {
  print('onError errorrrrrrr1');
  FlutterError.presentError(details);
   Builder(builder: (context) {
    print('onError errorrrrrrr2');
    return CustomErrorPage(
      errorDetails: details,
    );
  });

};*/
/*  FlutterError.onError = (FlutterErrorDetails details) {
    print('flutter errorrrrrrr1');
    FlutterError.presentError(details);
    FlutterError.dumpErrorToConsole(details);
    runApp(
      DevicePreview(
        enabled: false,
        builder: (context) =>
        const ProviderScope(child: MyApp()), // Wrap your app
      ),
    );
  };*/

  runApp(
    const ProviderScope(child: MyApp()),
  );
}
