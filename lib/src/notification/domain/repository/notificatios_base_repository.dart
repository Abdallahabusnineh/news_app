import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/notification/data/models/notification_models.dart';

abstract class NotificationsBaseRepository {
  Future<Either<Failure, List<NotificationModels>>> getNotifications();
  Future<Either<Failure, bool>> deleteNotificationsById(int id);
}
