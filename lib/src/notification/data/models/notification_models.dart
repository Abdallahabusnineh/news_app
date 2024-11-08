import 'package:news_app/src/notification/domain/entities/notification_entites.dart';

class NotificationModels extends NotificationEntites {
  NotificationModels(
      {required super.type,
      required super.newsId,
      required super.commentId,
      required super.createdAt,
      required super.newsPost,
      required super.notifierUserName,
      required super.notifierEmail,
      required super.notifierId,
      required super.notifiedUserName,
      required super.notifiedId,
      required super.notifiedEmail});

  factory NotificationModels.fromJson(Map<String, dynamic> json) {
    return NotificationModels(
      //notification model
      type: json['type']??'',
      newsId: json['id']??0,
      commentId: json['comment_id']??0,
      createdAt: json['created_at']??'',
      newsPost: json['news_post']??'',
      //notifier model
      notifierUserName: json['notifier_user']['user_name']??  '',
      notifierEmail: json['notifier_user']['email']??'',
      notifierId: json['notifier_user']['id']??0,
      //notified model
      notifiedUserName: json['notified_user']['user_name']??'',
      notifiedId: json['notified_user']['id']??0,
      notifiedEmail: json['notified_user']['email']??'',
    );

  }
  DateTime get createdAtDateTime {
    // Convert the string into a DateTime object when needed
    return DateTime.parse(createdAt);
  }
}
