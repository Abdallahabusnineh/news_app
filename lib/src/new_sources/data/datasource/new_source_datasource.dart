import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/shared/abstraction/dio_helper.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/network/api_urls.dart';
import 'package:news_app/shared/core/network/error_message_model.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/src/new_sources/data/model/new_source_model.dart';
import 'package:news_app/src/new_sources/data/model/your_following_models.dart';

abstract class BaseNewSourceDataSource {
  Future<List<NewSourceModel>> getNewSource(String text);

  Future<bool> follow(int id);

  Future<bool> checkFollow(int id);
  Future<List<YourFollowingModels>> yourFollowing();
}

class NewSourceDataSource extends BaseNewSourceDataSource {
  @override
  Future<List<NewSourceModel>> getNewSource(String text,) async {
    try {
      final res = await DioHelper.getData(
        url: ApiUrls.searchInNewSources(),
        query: {"searched_text": text},
        token: AppConstant.token,
      );
      //print('result is $AppConstant.token');

      if (res.statusCode == 200) {
        List<dynamic> data = res.data['result'];
        return List<NewSourceModel>.from(
            data.map((country) => NewSourceModel.fromJson(country)));
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

  @override
  Future<bool> follow(int id) async {
    try {
      final res = await DioHelper.postData(
        url: ApiUrls.follow(id),
        token: AppConstant.token,
        data: id,
      );
      //print('result is $AppConstant.token');

      if (res.statusCode == 200) {
        return res.data['result'] != false;
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log('Following datasource error ${e.response!.data}');
      log('Following datasource error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
              ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log('Following datasource error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
              ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }

  @override
  Future<bool> checkFollow(int id) async {
    try {
      final res = await DioHelper.getData(
        url: ApiUrls.follow(id),
        token: AppConstant.token,
      );
      //print('result is $AppConstant.token');
      if (res.statusCode == 200) {
        return res.data['result'];
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log('checkFollowing datasource error ${e.response!.data}');
      log('checkFollowing datasource error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
              ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log('checkFollowing datasource error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
              ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }

  @override
  Future<List<YourFollowingModels>> yourFollowing() async {
    try {
      final res = await DioHelper.getData(
        url: ApiUrls.yourFollowing(),
        token: AppConstant.token,
      );
      //print('result is $AppConstant.token');

      if (res.statusCode == 200) {
        List<dynamic> data = res.data['result']['followed'];
        return List<YourFollowingModels>.from(
            data.map((country) => NewSourceModel.fromJson(country)));
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log('yourFollowing c datasource error ${e.response!.data}');
      log('yourFollowing datasource error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log('yourFollowing s datasource error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }
}
