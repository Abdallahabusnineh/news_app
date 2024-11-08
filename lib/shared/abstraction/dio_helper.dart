import 'package:dio/dio.dart';
import 'package:news_app/shared/abstraction/cash_helper.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "",
        receiveDataWhenStatusError: true,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
        },
        /*  validateStatus: (status) {
          print('401 we must go to login page');
          if (status == 401) {
            AppConstant.token = '';
            print('logout ?????');
            CacheHelper.saveData(key: 'isAuth', value: false);
            AppConstant.isAuth = false;
            print('401 we must go to login page');
          } else {
            CacheHelper.saveData(key: 'isAuth', value: true);
            AppConstant.isAuth = true;
            return false;
          }
          return true;
        },*/
      ),
    );

    dio?.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      ),
      InterceptorsWrapper(
        /*onRequest: (options, handler) {
          if (AppConstant.token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer ${AppConstant.token}';
          }
          return handler.next(options);
        },*/
       /* onResponse: (response, handler) {
          if (response.statusCode == 401) {
            print('on response 401 we must go to login page');
            AppConstant.token = '';
            print('logout ?????');
            CacheHelper.saveData(key: 'isAuth', value: false);
            AppConstant.isAuth = false;
            appRouter.push(const LoginRoute());
          }
          return handler.next(response);
        },*/
        onError: (DioException error, handler) {
          if (error.response?.statusCode == 401) {
            // Call the logout method if a 401 error response occurs
            print('on error 401 we must go to login page');
            AppConstant.token = '';
            print('logout ?????');
            CacheHelper.saveData(key: 'isAuth', value: false);
            AppConstant.isAuth = false;
            appRouter.pushAndPopUntil(
                predicate: (route) => false,
                const LoginRoute());
          }
          return handler.next(error);
        },
      ),
    ]);
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      String? lang,
      String? token}) async {
    dio!.options.headers = {
      "Content-Type": "application/json",
      "Accept-Language": lang ?? "en",
      "Authorization": "Bearer $token",
      "accept": "application/json",
    };

    print('is we here????? ${dio!.options.baseUrl}');
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required data,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      "Content-Type": "application/json",
      "Accept-Language": lang ?? "en",
      "Authorization": "Bearer $token",
      "accept": "application/json",
    };
    var x = await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
    return x;
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      "Content-Type": "application/json",
      "lang": lang ?? "en",
      "Authorization": "Bearer $token",
      "accept": "application/json",
    };
    var x = await dio!.put(url, queryParameters: query, data: data);
    return x;
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      "Content-Type": "application/json",
      "Accept-Language": lang ?? "en",
      "Authorization": "Bearer $token",
      "accept": "application/json",
    };
    var x = await dio!.delete(
      url,
      queryParameters: query,
      data: data,
    );
    return x;
  }

  static Future<Response> patchData({
    required String url,
    Map<String, dynamic>? query,
    required List<Map<String, dynamic>> data,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      "Content-Type": "application/json",
      "Accept-Language": lang ?? "en",
      "Authorization": "Bearer $token",
      "accept": "application/json",
    };
    var x = await dio!.patch(url, queryParameters: query, data: data);
    return x;
  }
}
