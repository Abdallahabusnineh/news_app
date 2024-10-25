import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/shared/abstraction/dio_helper.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/network/api_urls.dart';
import 'package:news_app/shared/core/network/error_message_model.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/src/comment_screen/data/modules/comment_model.dart';
import 'package:news_app/src/comment_screen/data/modules/create_comment_model.dart';
import 'package:news_app/src/comment_screen/data/modules/edit_comment_model.dart';

abstract class CommentBaseDatasource {
  Future<List<GetCommentModel>> getCommentsByNewsId(int postId);
  Future<CreateCommentModel> createComment(int postId, String comment);
  Future<EditCommentModel> editComment(int postId,int commentId ,String comment);
}

class CommentDatasource extends CommentBaseDatasource {
  @override
  Future<List<GetCommentModel>> getCommentsByNewsId(int postId) async {
    try {
      final res = await DioHelper.getData(
        url: ApiUrls.getCommentsByPostId(postId),
        token: AppConstant.token,
      );

      if (res.statusCode == 200) {
        List<dynamic> data = res.data['result'];
        return List<GetCommentModel>.from(
            data.map((e) => GetCommentModel.fromJson(e)));
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log(' get comment by postid  error ${e.response!.data}');
      log(' get comment by postid error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
              ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log(' get comment by postid  error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
              ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }

  @override
  Future<CreateCommentModel> createComment(int postId, String comment) async {
    try {
      final res = await DioHelper.postData(
        url: ApiUrls.createComment(),
        token: AppConstant.token, data: {
        'news_id': postId.toString(),
        'content': comment
        },
      );

      if (res.statusCode == 200) {

        return   CreateCommentModel.fromJson(res.data['result']);
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log(' create comment  ddd error ${e.response!.data}');
      log(' create comment error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log(' create comment dd  error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }}

  @override
  Future<EditCommentModel> editComment(int postId, int commentId, String comment) async {
    try {
      final res = await DioHelper.putData(
        url: ApiUrls.editComment(commentId),
        token: AppConstant.token, data: {
        'news_id': postId,
        'content': comment
      },
      );

      if (res.statusCode == 200) {

        return   EditCommentModel.fromJson(res.data['result']);
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log(' edit comment  ddd error ${e.response!.data}');
      log(' edit comment error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log(' edit comment dd  error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }
}
