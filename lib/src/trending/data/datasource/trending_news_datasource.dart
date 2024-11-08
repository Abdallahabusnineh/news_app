

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/shared/abstraction/dio_helper.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/network/api_urls.dart';
import 'package:news_app/shared/core/network/error_message_model.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';

import 'package:news_app/src/trending/data/models/trending_news_model.dart';

abstract class TrendingNewsBaseDataSource {
  Future<List<TrendingNewsModel>> getTrendingNews();
}

class TrendingNewsDatasource extends TrendingNewsBaseDataSource {
  @override
  Future<List<TrendingNewsModel>> getTrendingNews() async {
    try {
      final res = await DioHelper.getData(
        url: ApiUrls.getTrendingNews(),
        token: AppConstant.token,
      );
      //print('result is $AppConstant.token');

      if (res.statusCode == 200) {
        List<dynamic> data = res.data['result'];
        return List<TrendingNewsModel>.from(
            data.map((e) => TrendingNewsModel.fromJson(e)));
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log('TrendingNews datasource error ${e.response!.data}');
      log('TrendingNews datasource error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log('TrendingNews datasource error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }
}