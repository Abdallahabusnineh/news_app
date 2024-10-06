import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/shared/abstraction/dio_helper.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/shared/core/network/api_urls.dart';
import 'package:news_app/shared/core/network/error_message_model.dart';
import 'package:news_app/src/auth/data/model/user_model.dart';
import 'package:dartz/dartz.dart';
abstract class BaseAuthDataSource {
  Future<UserModel> login(String username, String password);

  Future<UserModel> register(
      String username, String email, String password, String confirmPassword);
}

class AuthDataSource extends BaseAuthDataSource {


  @override
  Future<UserModel> register(
      String username, String email, String password, String confirmPassword) async {
    try {
      final res = await DioHelper.postData(
        url: ApiUrls.register(),
        data: {
          "email": email,
          "user_name": username,
          "password": password,
          "password_confirmation": confirmPassword
        },
      );


      if (res.statusCode == 200) {
        return UserModel.fromJson(res.data['result']);
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log('auth datasource error ${e.response!.data}');
      log('auth datasource error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log('auth datasource error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }

  @override
  Future<UserModel> login(String username, String password) async{
    try {
      final res = await DioHelper.postData(
        url: ApiUrls.login(),
        data: {
          "user_name": username,
          "password": password,
        },
      );

      if (res.statusCode == 200) {
        return UserModel.fromJson(res.data['result']);
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log('auth datasource error ${e.response!.data}');
      log('auth datasource error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log('auth datasource error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }
}
