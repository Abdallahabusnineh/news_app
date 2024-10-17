

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/shared/abstraction/dio_helper.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/network/api_urls.dart';
import 'package:news_app/shared/core/network/error_message_model.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/src/home/data/models/all_news_model.dart';

abstract class AllNewsBaseDataSource {
  Future<List<AllNewsModel>> getAllNews();
}

class AllNewsDataSource extends AllNewsBaseDataSource {
  @override
  Future<List<AllNewsModel>> getAllNews() async {
    try {
      final res = await DioHelper.getData(
        url: ApiUrls.getAllNews(),
        token: AppConstant.token,
      );
      //print('result is $AppConstant.token');

      if (res.statusCode == 200) {
        List<dynamic> data = res.data['result'];
        return List<AllNewsModel>.from(
            data.map((e) => AllNewsModel.fromJson(e)));
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log('newSources datasource error ${e.response!.data}');
      log('newSources datasource error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log('newSources datasource error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }
}