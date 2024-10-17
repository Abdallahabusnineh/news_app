import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/shared/abstraction/dio_helper.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/network/api_urls.dart';
import 'package:news_app/shared/core/network/error_message_model.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/src/select_country/data/model/countries_model.dart';


abstract class BaseCountriesDataSource {
  Future<List<CountriesModel>> getCountries(String text);
}
class CountriesDataSource extends BaseCountriesDataSource {
  @override
  Future<List<CountriesModel>> getCountries(String text) async {
    try {
      final res = await DioHelper.getData(
        url: ApiUrls.getCountries(),
       query: {
         "searched_text": text
       },
        token:  AppConstant.token,
      );
      //print('result is $AppConstant.token');

      if (res.statusCode == 200) {
        List<dynamic> data = res.data['result'];
        return       List<CountriesModel>.from(
            data.map((country) => CountriesModel.fromJson(country)));
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log('country datasource error ${e.response!.data}');
      log('country datasource error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log('country datasource error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }
}
