import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/notification/data/datasource/notificatios_datasource.dart';
import 'package:news_app/src/notification/data/models/notification_models.dart';
import 'package:news_app/src/notification/domain/repository/notificatios_base_repository.dart';
 

class NotificationsRepository extends NotificationsBaseRepository {
  NotificationBaseDataSource notificationsBaseDatasource;
  NotificationsRepository(this.notificationsBaseDatasource);

  @override
  Future<Either<Failure, List<NotificationModels>>> getNotifications() async {
    try {
      final result = await notificationsBaseDatasource.getNotifications();
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteNotificationsById(int id) async {
    try {
      final result = await notificationsBaseDatasource.deleteNotification(id);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }


}