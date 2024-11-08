import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/shared/abstraction/dio_helper.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/network/api_urls.dart';
import 'package:news_app/shared/core/network/error_message_model.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/src/edit_profile/data/model/edit_your_profile_model.dart';


abstract class EditYourProfileBaseDataSource {
  Future<EditProfileModel> editProfile(FormData formData);
}

class EditYourProfileDatasource extends EditYourProfileBaseDataSource {
  @override
  Future<EditProfileModel> editProfile(FormData formData) async {
    try {
      final res = await DioHelper.postData(
        url: ApiUrls.editYourProfile(),
        token: AppConstant.token,
        data: formData,
      );
      //print('result is $AppConstant.token');
      if (res.statusCode == 200) {
        return EditProfileModel.fromJson( res.data['result']);
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log('EditProfile datasource error ${e.response!.data}');
      log('EditProfile datasource error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log('EditProfile datasource error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }
}
