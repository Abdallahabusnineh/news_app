import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/shared/abstraction/dio_helper.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/network/api_urls.dart';
import 'package:news_app/shared/core/network/error_message_model.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/src/post_screen/data/modules/get_post_info_model.dart';

abstract class GetPostInfoBaseDatasource {
  Future<GetPostInfoModel> getPostInfo(int postId);

  Future<bool> toggleLikePost(int postId);
}

class GetPostInfoDatasource extends GetPostInfoBaseDatasource {
  @override
  Future<GetPostInfoModel> getPostInfo(int postId) async {
    try {
      final res = await DioHelper.getData(
        url: ApiUrls.getPostInfoById(postId),
        token: AppConstant.token,
      );

      if (res.statusCode == 200) {
        return GetPostInfoModel.fromJson(res.data['result']);
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log('post info datasource error ${e.response!.data}');
      log('post info datasource error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
              ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log('post info datasource error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
              ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }

  @override
  Future<bool> toggleLikePost(int postId) async {
    try {
      final res = await DioHelper.postData(
        url: ApiUrls.toggleLikePost(),
        token: AppConstant.token,
        data: {
          "new_id": postId,
        },
      );

      if (res.statusCode == 200) {
        return res.data['result'];
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log('like post  info datasource error ${e.response!.data}');
      log('like post info datasource error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
              ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log('like post info datasource error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
              ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }
}
