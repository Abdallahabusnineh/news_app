
import 'package:dio/dio.dart';

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
      ),
    );
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
      "Authorization": token ?? "",
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
      "Authorization": token ?? "",
      "accept": "application/json",
    };
    var x = await dio!.delete(url, queryParameters: query, data: data);
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
      "Authorization": token ?? "",
      "accept": "application/json",
    };
    var x = await dio!.patch(url, queryParameters: query, data: data);
    return x;
  }
}
