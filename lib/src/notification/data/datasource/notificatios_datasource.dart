import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/shared/abstraction/dio_helper.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/network/api_urls.dart';
import 'package:news_app/shared/core/network/error_message_model.dart';
import 'package:news_app/shared/core/utils/app_constant.dart';
import 'package:news_app/src/notification/data/models/notification_models.dart';

abstract class NotificationBaseDataSource {
  Future<List<NotificationModels>> getNotifications();
  Future<bool> deleteNotification(int id);
}
class NotificationDataSource extends NotificationBaseDataSource{
  @override
  Future<List<NotificationModels>> getNotifications() async {
    try {
      final res = await DioHelper.getData(
        url: ApiUrls.getNotifications(),
        token: AppConstant.token,
      );
      //print('result is $AppConstant.token');

      if (res.statusCode == 200) {
        List<dynamic> data = res.data['result'];
        return List<NotificationModels>.from(
            data.map((e) => NotificationModels.fromJson(e)));
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                res.data['message'], res.data['errors'], true));
      }
    } on DioException catch (e) {
      log('notifications datasource error ${e.response!.data}');
      log('notifications datasource error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log('notifications datasource error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }

  @override
  Future<bool> deleteNotification(int id) async {
    try {
      final res = await DioHelper.deleteData(
        url: ApiUrls.deleteNotificationById(id),
        data: {},
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
      log('delete notifications datasource error ${e.response!.data}');
      log('delete notifications datasource error ${e.response!.statusCode}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!, e.message!, true));
    } catch (e) {
      log('delete notifications datasource error ${e.toString()}');
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.toString(), e.toString(), true));
    }
  }

}