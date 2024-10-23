import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/shared/abstraction/dio_helper.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/network/api_urls.dart';
import 'package:news_app/shared/core/network/error_message_model.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/src/visit_profile_author/data/modules/news_by_user_id_models.dart';
import 'package:news_app/src/visit_profile_author/data/modules/profile_author_models.dart';

abstract class ProfileAuthorBaseDataSource {
  Future<ProfileAuthorModels> getProfileAuthor(int authorId);
  Future<List<NewsByUserIdModels>> getNewsByUserId(int authorId);
}

class ProfileAuthorDatasource extends ProfileAuthorBaseDataSource {
  @override
  Future<ProfileAuthorModels> getProfileAuthor(int authorId) async {
    try {
      final res = await DioHelper.getData(
        url: ApiUrls.getAuthorInfoProfile(authorId),
        token: AppConstant.token,
      );
      //print('result is $AppConstant.token');
      if (res.statusCode == 200) {
        return ProfileAuthorModels.fromJson(res.data['result']);
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log('ProfileAuthorDatasource datasource error ${e.response!.data}');
      log('ProfileAuthorDatasource datasource error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log('ProfileAuthorDatasource datasource error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }

  @override
  Future<List<NewsByUserIdModels>> getNewsByUserId(int authorId) async {
    try {
      final res = await DioHelper.getData(
        url: ApiUrls.getNewsByUserId(authorId),
        token: AppConstant.token,
      );
      //print('result is $AppConstant.token');
      if (res.statusCode == 200) {
        List<dynamic> data = res.data['result'];
        return List<NewsByUserIdModels>.from(
            data.map((e) => NewsByUserIdModels.fromJson(e)));
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log('getNewsByUserId datasource error ${e.response!.data}');
      log('getNewsByUserId datasource error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log('getNewsByUserId datasource error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }
}
