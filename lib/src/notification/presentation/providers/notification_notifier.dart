import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/notification/data/datasource/notificatios_datasource.dart';
import 'package:news_app/src/notification/data/models/notification_models.dart';
import 'package:news_app/src/notification/data/repository/notificatios_repository.dart';

final notificationChangeNotifierProvider = ChangeNotifierProvider((ref) {
  return NotificationNotifier();
});

class NotificationNotifier extends ChangeNotifier {
  NotificationNotifier() {
    getNotifications();
  /*  groupedItems = groupItemsByCategory(notification);
  */}

  NotificationsRepository notificationsRepository =
      NotificationsRepository(NotificationDataSource());
  /*List<NotificationModels> notification = [];*/
  Map<String, List<NotificationModels>> groupedNotifications={};

bool _deleteNotification = false;
  bool get deleteNotification => _deleteNotification;
  set deleteNotification(bool value) {
    _deleteNotification = value;
    notifyListeners();
  }
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isError = false;

  bool get isError => _isError;

  set isError(bool value) {
    _isError = value;
    notifyListeners();
  }

  bool _isSuccess = false;

  bool get isSuccess => _isSuccess;

  set isSuccess(bool value) {
    _isSuccess = value;
    notifyListeners();
  }

  Future<void> getNotifications() async {
    isLoading = true;
    groupedNotifications = {};
    try {
      final result = await notificationsRepository.getNotifications();
      result.fold((l) {
        isError = true;
      }, (r) async {

        groupNotificationsByDate(r);
        isSuccess = true;
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }


  Map<String, List<NotificationModels>> groupNotificationsByDate(List<NotificationModels> notifications) {
    for (var notification in notifications) {
      // Convert `createdAt` string to `DateTime`, then format it to a date string (YYYY-MM-DD)
      String date = notification.createdAtDateTime.toIso8601String().split('T')[0]; // Extract date part

      if (!groupedNotifications.containsKey(date)) {
        groupedNotifications[date] = [];
      }
      groupedNotifications[date]!.add(notification);
    }

    return groupedNotifications;
  }


  Future<void> deleteNotificationById(int id) async {
    isLoading = true;
    try {
      final result = await notificationsRepository.deleteNotificationsById(id);
      result.fold((l) {
        isError = true;
      }, (r) async {
        deleteNotification = true;
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }

/*  void notificationGroupByDate() {
    var groupedNotifications = groupBy(
      notification,
      (NotificationModels notification) =>
          DateFormat('yyyy-MM-dd').format(notification.createdAt as DateTime),
    );
    notificationsByDate = groupedNotifications;
  }*/
}
