import 'package:news_app/shared/core/utils/app_assets.dart';
enum NotificationType { follow, like, newPost }

class NotificationModel {
  final String title;
  final String body;
  final String dateTime;
  final String image;
  final NotificationType type;
  NotificationModel({required this.title, required this.body, required this.dateTime, required this.image, required this.type});
}
List<NotificationModel>allNotification = [
  NotificationModel(
    type: NotificationType.newPost,
    image: AppAssets.notificationImg,
    title: 'BBC News',
    body: ' has posted new Europe news “Ukraine\'s President Zele...”',
    dateTime: '15m ago',
  ),
  NotificationModel(
    type: NotificationType.follow,
    image: AppAssets.notificationImg,
    title: 'abdallah ',
    body: 'followed you',
    dateTime: '15m ago',
  ),
  NotificationModel(
    type: NotificationType.newPost,
    image: AppAssets.notificationImg,
    title: 'BBC News',
    body: 'has posted new Europe news “Ukraine\'s President Zele...”',
    dateTime: '15m ago',
  ),
  NotificationModel(
    type: NotificationType.follow,
    image: AppAssets.notificationImg,
    title: 'abdallah',
    body: 'followed you',
    dateTime: '15m ago',
  ),
  NotificationModel(
    type: NotificationType.newPost,
    image: AppAssets.notificationImg,
    title: 'abdallah',
    body: 'followed you',
    dateTime: '15m ago',
  ),
  NotificationModel(
    type: NotificationType.follow,
    image: AppAssets.notificationImg,
    title: 'BBC News',
    body: 'has posted new Europe news “Ukraine\'s President Zele...”',
    dateTime: '15m ago',
  ),


];
