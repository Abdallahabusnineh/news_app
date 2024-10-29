import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/shared/abstraction/dio_helper.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/network/api_urls.dart';
import 'package:news_app/shared/core/network/error_message_model.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/src/bookmark/data/modules/all_bookmark_model.dart';

abstract class BookmarkBaseDatasource {
  Future<dynamic> addFavBookmark(int postId);

  Future<List<AllBookmarkModel>> getAllBookmark();
}

class BookmarkDatasource extends BookmarkBaseDatasource {
  @override
  Future<dynamic> addFavBookmark(int postId) async {
    try {
      final res = await DioHelper.postData(
        url: ApiUrls.addNewsToFavorites(postId),
        token: AppConstant.token,
        data: {},
      );

      if (res.statusCode == 200) {
        if(res.data['result']==false) {
          return res.data['result'];
        }
        return AllBookmarkModel.fromJson(res.data['result']);
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log(' toggle bookmark fav error ${e.response!.data}');
      log(' toggle bookmark fav error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
              ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log(' toggle bookmark fav error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
              ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }

  @override
  Future<List<AllBookmarkModel>> getAllBookmark() async {
    try {
      final res = await DioHelper.getData(
        url: ApiUrls.getAllBookmarks(),
        token: AppConstant.token,
      );

      if (res.statusCode == 200) {
        List<dynamic> data = res.data['result'];
        return List<AllBookmarkModel>.from(
            data.map((e) => AllBookmarkModel.fromJson(e)));
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log(' getAll bookmark  error ${e.response!.data}');
      log(' getAll bookmark error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
              ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log(' getAll bookmark  error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
              ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }
}
