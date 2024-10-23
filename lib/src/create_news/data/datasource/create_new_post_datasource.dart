import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/shared/abstraction/dio_helper.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/network/api_urls.dart';
import 'package:news_app/shared/core/network/error_message_model.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/src/create_news/data/modules/create_new_post_models.dart';

abstract class CreateNewPostBaseDataSource {
  Future<CreateNewPostModels> createPost(FormData formData);
}
class CreateNewPostDataSource extends CreateNewPostBaseDataSource{
  @override
  Future<CreateNewPostModels> createPost(FormData formData) async {
    try {
      final res = await DioHelper.postData(
        url: ApiUrls.createNewPost(),
        token: AppConstant.token,
        data: formData,
      );

      if (res.statusCode == 200) {
     
        return CreateNewPostModels.fromJson(res.data['result']);
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log(' create newpost datasourceerror ${e.response!.data}');
      log(' create newpost datasourceerror ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log(' create newpost datasourceerror ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
 }
}