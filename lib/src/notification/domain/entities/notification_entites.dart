class NotificationEntites {
  //notification info
  final String type;
  final int newsId;
  final int commentId;
  final String createdAt;
  final dynamic newsPost;

  //notifier info
  final String notifierUserName;
  final String notifierEmail;
  final int notifierId;

//notified info
  final String notifiedUserName;
  final int notifiedId;
  final String notifiedEmail;

  NotificationEntites(
      {required this.type,
      required this.newsId,
      required this.commentId,
      required this.createdAt,
      required this.newsPost,
      required this.notifierUserName,
      required this.notifierEmail,
      required this.notifierId,
      required this.notifiedUserName,
      required this.notifiedId,
      required this.notifiedEmail});

/* //post info
 final String
 final String postTitle;
 final String postImageUri;*/
}
