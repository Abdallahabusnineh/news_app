import 'package:news_app/src/visit_profile_author/domain/entities/news_by_user_id.dart';

class NewsByUserIdModels extends NewsByUserId {
  NewsByUserIdModels(
      {required super.postId,
        required super.topicId,
        required super.postImageUri,
        required super.title,
        required super.content,
        required super.createdAt,
        required super.userId,
        required super.userName,
        required super.email,
        required super.type,
        required super.userImageUri});

  factory NewsByUserIdModels.fromJson(Map<String, dynamic> json) {
    return NewsByUserIdModels(
      // ************ post model**************
      postId: json['id'],
      topicId: json['topic_id'],
      postImageUri: json['image_uri'],
      title: json['title'],
      content: json['content'],
      createdAt: json['created_at'],
      // ************ user model**************
      userId: json['user']['id'],
      userName: json['user']['user_name'],
      email: json['user']['email'],
      type: json['user']['type'],
      userImageUri: json['user']['profile']['image_uri'],
    );
  }

}


