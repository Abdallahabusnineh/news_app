/*
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/shared/abstraction/dio_helper.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/network/api_urls.dart';
import 'package:news_app/shared/core/network/error_message_model.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/src/fill_profile/data/model/fill_your_profile_model.dart';

abstract class BaseDataSourceCreateYourProfile {
  Future<CreateProfileModel> createProfile(String fullName, String phone);
}

class CreateYourProfileDataSource extends BaseDataSourceCreateYourProfile {
  @override
  Future<CreateProfileModel> createProfile(String fullName,
      String phone) async {
    try {
      final res = await DioHelper.postData(
        url: ApiUrls.createYourProfile(),
        token: AppConstant.token,
        data:{
          "phone_number": phone,
          "full_name": fullName,
          "country_id": 1,
          "topics:": 1,
          "profile_photo":'image.png'
        },
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
      log('createProfile datasource error ${e.response!.data}');
      log('createProfile datasource error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log('createProfile datasource error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }
}*/
